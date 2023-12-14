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
        let sut = partial(f2, .deferred, arr[1])
        let expected = f2(arr[0], arr[1])
        XCTAssertEqual(expected, sut(arr[0]))
    }

    func test_throws_partialTwoArgumentsFunctionFirstArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 2)
        let sut = partial(f2t, .deferred, arr[1])
        let expected = try f2t(arr[0], arr[1])
        XCTAssertEqual(expected, try sut(arr[0]))
    }

    func test_async_partialTwoArgumentsFunctionFirstArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 2)
        let sut = partial(aF2, .deferred, arr[1])
        let expected = await aF2(arr[0], arr[1])
        let result = await sut(arr[0])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialTwoArgumentsFunctionFirstArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 2)
        let sut = partial(aF2T, .deferred, arr[1])
        let expected = try await aF2T(arr[0], arr[1])
        let result = try await sut(arr[0])
        XCTAssertEqual(expected, result)
    }

    func test_partialTwoArgumentsFunctionSecondArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 2)
        let sut = partial(f2, arr[0], .deferred)
        let expected = f2(arr[0], arr[1])
        XCTAssertEqual(expected, sut(arr[1]))
    }

    func test_throws_partialTwoArgumentsFunctionSecondArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 2)
        let sut = partial(f2t, arr[0], .deferred)
        let expected = try f2t(arr[0], arr[1])
        XCTAssertEqual(expected, try sut(arr[1]))
    }

    func test_async_partialTwoArgumentsFunctionSecondArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 2)
        let sut = partial(aF2, arr[0], .deferred)
        let expected = await aF2(arr[0], arr[1])
        let result = await sut(arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialTwoArgumentsFunctionSecondArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 2)
        let sut = partial(aF2T, arr[0], .deferred)
        let expected = try await aF2T(arr[0], arr[1])
        let result = try await sut(arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_partialThreeArgumentsFunctionFirstArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(f3, .deferred, arr[1], arr[2])
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, sut(arr[0]))
    }

    func test_throws_partialThreeArgumentsFunctionFirstArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(f3t, .deferred, arr[1], arr[2])
        let expected = try f3t(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, try sut(arr[0]))
    }

    func test_async_partialThreeArgumentsFunctionFirstArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(aF3, .deferred, arr[1], arr[2])
        let expected = await aF3(arr[0], arr[1], arr[2])
        let result = await sut(arr[0])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialThreeArgumentsFunctionFirstArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(aF3T, .deferred, arr[1], arr[2])
        let expected = try await aF3T(arr[0], arr[1], arr[2])
        let result = try await sut(arr[0])
        XCTAssertEqual(expected, result)
    }

    func test_partialThreeArgumentsFunctionFirstSecondArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(f3, .deferred, .deferred, arr[2])
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, sut(arr[0], arr[1]))
    }

    func test_throws_partialThreeArgumentsFunctionFirstSecondArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(f3t, .deferred, .deferred, arr[2])
        let expected = try f3t(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, try sut(arr[0], arr[1]))
    }

    func test_async_partialThreeArgumentsFunctionFirstSecondArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(aF3, .deferred, .deferred, arr[2])
        let expected = await aF3(arr[0], arr[1], arr[2])
        let result = await sut(arr[0], arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialThreeArgumentsFunctionFirstSecondArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(aF3T, .deferred, .deferred, arr[2])
        let expected = try await aF3T(arr[0], arr[1], arr[2])
        let result = try await sut(arr[0], arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_partialThreeArgumentsFunctionFirstThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(f3, .deferred, arr[1], .deferred)
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, sut(arr[0], arr[2]))
    }

    func test_throws_partialThreeArgumentsFunctionFirstThirdArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(f3t, .deferred, arr[1], .deferred)
        let expected = try f3t(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, try sut(arr[0], arr[2]))
    }

    func test_async_partialThreeArgumentsFunctionFirstThirdArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(aF3, .deferred, arr[1], .deferred)
        let expected = await aF3(arr[0], arr[1], arr[2])
        let result = await sut(arr[0], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialThreeArgumentsFunctionFirstThirdArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(aF3T, .deferred, arr[1], .deferred)
        let expected = try await aF3T(arr[0], arr[1], arr[2])
        let result = try await sut(arr[0], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_partialThreeArgumentsFunctionSecondArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(f3, arr[0], .deferred, arr[2])
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, sut(arr[1]))
    }

    func test_throws_partialThreeArgumentsFunctionSecondArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(f3t, arr[0], .deferred, arr[2])
        let expected = try f3t(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, try sut(arr[1]))
    }

    func test_async_partialThreeArgumentsFunctionSecondArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(aF3, arr[0], .deferred, arr[2])
        let expected = await aF3(arr[0], arr[1], arr[2])
        let result = await sut(arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialThreeArgumentsFunctionSecondArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(aF3T, arr[0], .deferred, arr[2])
        let expected = try await aF3T(arr[0], arr[1], arr[2])
        let result = try await sut(arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_partialThreeArgumentsFunctionSecondThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(f3, arr[0], .deferred, .deferred)
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, sut(arr[1], arr[2]))
    }

    func test_throws_partialThreeArgumentsFunctionSecondThirdArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(f3t, arr[0], .deferred, .deferred)
        let expected = try f3t(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, try sut(arr[1], arr[2]))
    }

    func test_async_partialThreeArgumentsFunctionSecondThirdArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(aF3, arr[0], .deferred, .deferred)
        let expected = await aF3(arr[0], arr[1], arr[2])
        let result = await sut(arr[1], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialThreeArgumentsFunctionSecondThirdArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(aF3T, arr[0], .deferred, .deferred)
        let expected = try await aF3T(arr[0], arr[1], arr[2])
        let result = try await sut(arr[1], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_partialThreeArgumentsFunctionThirdArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(f3, arr[0], arr[1], .deferred)
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, sut(arr[2]))
    }

    func test_throws_partialThreeArgumentsFunctionThirdArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(f3t, arr[0], arr[1], .deferred)
        let expected = try f3t(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, try sut(arr[2]))
    }

    func test_async_partialThreeArgumentsFunctionThirdArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(aF3, arr[0], arr[1], .deferred)
        let expected = await aF3(arr[0], arr[1], arr[2])
        let result = await sut(arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialThreeArgumentsFunctionThirdArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 3)
        let sut = partial(aF3T, arr[0], arr[1], .deferred)
        let expected = try await aF3T(arr[0], arr[1], arr[2])
        let result = try await sut(arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_partialFourArgumentsFunctionFirstArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4, .deferred, arr[1], arr[2], arr[3])
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, sut(arr[0]))
    }

    func test_throws_partialFourArgumentsFunctionFirstArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4t, .deferred, arr[1], arr[2], arr[3])
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try sut(arr[0]))
    }

    func test_async_partialFourArgumentsFunctionFirstArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4, .deferred, arr[1], arr[2], arr[3])
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let result = await sut(arr[0])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFourArgumentsFunctionFirstArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4T, .deferred, arr[1], arr[2], arr[3])
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let result = try await sut(arr[0])
        XCTAssertEqual(expected, result)
    }

    func test_partialFourArgumentsFunctionFirstSecondArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4, .deferred, .deferred, arr[2], arr[3])
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, sut(arr[0], arr[1]))
    }

    func test_throws_partialFourArgumentsFunctionFirstSecondArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4t, .deferred, .deferred, arr[2], arr[3])
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try sut(arr[0], arr[1]))
    }

    func test_async_partialFourArgumentsFunctionFirstSecondArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4, .deferred, .deferred, arr[2], arr[3])
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let result = await sut(arr[0], arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFourArgumentsFunctionFirstSecondArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4T, .deferred, .deferred, arr[2], arr[3])
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let result = try await sut(arr[0], arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_partialFourArgumentsFunctionFirstSecondThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4, .deferred, .deferred, .deferred, arr[3])
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, sut(arr[0], arr[1], arr[2]))
    }

    func test_throws_partialFourArgumentsFunctionFirstSecondThirdArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4t, .deferred, .deferred, .deferred, arr[3])
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try sut(arr[0], arr[1], arr[2]))
    }

    func test_async_partialFourArgumentsFunctionFirstSecondThirdArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4, .deferred, .deferred, .deferred, arr[3])
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let result = await sut(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFourArgumentsFunctionFirstSecondThirdArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4T, .deferred, .deferred, .deferred, arr[3])
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let result = try await sut(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_partialFourArgumentsFunctionFirstSecondFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4, .deferred, .deferred, arr[2], .deferred)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, sut(arr[0], arr[1], arr[3]))
    }

    func test_throws_partialFourArgumentsFunctionFirstSecondFourthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4t, .deferred, .deferred, arr[2], .deferred)
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try sut(arr[0], arr[1], arr[3]))
    }

    func test_async_partialFourArgumentsFunctionFirstSecondFourthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4, .deferred, .deferred, arr[2], .deferred)
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let result = await sut(arr[0], arr[1], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFourArgumentsFunctionFirstSecondFourthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4T, .deferred, .deferred, arr[2], .deferred)
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let result = try await sut(arr[0], arr[1], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialFourArgumentsFunctionFirstThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4, .deferred, arr[1], .deferred, arr[3])
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, sut(arr[0], arr[2]))
    }

    func test_throws_partialFourArgumentsFunctionFirstThirdArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4t, .deferred, arr[1], .deferred, arr[3])
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try sut(arr[0], arr[2]))
    }

    func test_async_partialFourArgumentsFunctionFirstThirdArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4, .deferred, arr[1], .deferred, arr[3])
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let result = await sut(arr[0], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFourArgumentsFunctionFirstThirdArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4T, .deferred, arr[1], .deferred, arr[3])
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let result = try await sut(arr[0], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_partialFourArgumentsFunctionFirstThirdFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4, .deferred, arr[1], .deferred, .deferred)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, sut(arr[0], arr[2], arr[3]))
    }

    func test_throws_partialFourArgumentsFunctionFirstThirdFourthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4t, .deferred, arr[1], .deferred, .deferred)
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try sut(arr[0], arr[2], arr[3]))
    }

    func test_async_partialFourArgumentsFunctionFirstThirdFourthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4, .deferred, arr[1], .deferred, .deferred)
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let result = await sut(arr[0], arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFourArgumentsFunctionFirstThirdFourthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4T, .deferred, arr[1], .deferred, .deferred)
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let result = try await sut(arr[0], arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialFourArgumentsFunctionFirstFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4, .deferred, arr[1], arr[2], .deferred)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, sut(arr[0], arr[3]))
    }

    func test_throws_partialFourArgumentsFunctionFirstFourthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4t, .deferred, arr[1], arr[2], .deferred)
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try sut(arr[0], arr[3]))
    }

    func test_async_partialFourArgumentsFunctionFirstFourthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4, .deferred, arr[1], arr[2], .deferred)
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let result = await sut(arr[0], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFourArgumentsFunctionFirstFourthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4T, .deferred, arr[1], arr[2], .deferred)
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let result = try await sut(arr[0], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialFourArgumentsFunctionSecondArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4, arr[0], .deferred, arr[2], arr[3])
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, sut(arr[1]))
    }

    func test_throws_partialFourArgumentsFunctionSecondArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4t, arr[0], .deferred, arr[2], arr[3])
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try sut(arr[1]))
    }

    func test_async_partialFourArgumentsFunctionSecondArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4, arr[0], .deferred, arr[2], arr[3])
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let result = await sut(arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFourArgumentsFunctionSecondArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4T, arr[0], .deferred, arr[2], arr[3])
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let result = try await sut(arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_partialFourArgumentsFunctionSecondThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4, arr[0], .deferred, .deferred, arr[3])
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, sut(arr[1], arr[2]))
    }

    func test_throws_partialFourArgumentsFunctionSecondThirdArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4t, arr[0], .deferred, .deferred, arr[3])
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try sut(arr[1], arr[2]))
    }

    func test_async_partialFourArgumentsFunctionSecondThirdArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4, arr[0], .deferred, .deferred, arr[3])
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let result = await sut(arr[1], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFourArgumentsFunctionSecondThirdArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4T, arr[0], .deferred, .deferred, arr[3])
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let result = try await sut(arr[1], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_partialFourArgumentsFunctionSecondThirdFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4, arr[0], .deferred, .deferred, .deferred)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, sut(arr[1], arr[2], arr[3]))
    }

    func test_throws_partialFourArgumentsFunctionSecondThirdFourthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4t, arr[0], .deferred, .deferred, .deferred)
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try sut(arr[1], arr[2], arr[3]))
    }

    func test_async_partialFourArgumentsFunctionSecondThirdFourthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4, arr[0], .deferred, .deferred, .deferred)
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let result = await sut(arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFourArgumentsFunctionSecondThirdFourthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4T, arr[0], .deferred, .deferred, .deferred)
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let result = try await sut(arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialFourArgumentsFunctionSecondFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4, arr[0], .deferred, arr[2], .deferred)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, sut(arr[1], arr[3]))
    }

    func test_throws_partialFourArgumentsFunctionSecondFourthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4t, arr[0], .deferred, arr[2], .deferred)
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try sut(arr[1], arr[3]))
    }

    func test_async_partialFourArgumentsFunctionSecondFourthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4, arr[0], .deferred, arr[2], .deferred)
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let result = await sut(arr[1], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFourArgumentsFunctionSecondFourthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4T, arr[0], .deferred, arr[2], .deferred)
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let result = try await sut(arr[1], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialFourArgumentsFunctionThirdArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4, arr[0], arr[1], .deferred, arr[3])
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, sut(arr[2]))
    }

    func test_throws_partialFourArgumentsFunctionThirdArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4t, arr[0], arr[1], .deferred, arr[3])
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try sut(arr[2]))
    }

    func test_async_partialFourArgumentsFunctionThirdArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4, arr[0], arr[1], .deferred, arr[3])
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let result = await sut(arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFourArgumentsFunctionThirdArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4T, arr[0], arr[1], .deferred, arr[3])
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let result = try await sut(arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_partialFourArgumentsFunctionThirdFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4, arr[0], arr[1], .deferred, .deferred)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, sut(arr[2], arr[3]))
    }

    func test_throws_partialFourArgumentsFunctionThirdFourthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4t, arr[0], arr[1], .deferred, .deferred)
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try sut(arr[2], arr[3]))
    }

    func test_async_partialFourArgumentsFunctionThirdFourthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4, arr[0], arr[1], .deferred, .deferred)
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let result = await sut(arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFourArgumentsFunctionThirdFourthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4T, arr[0], arr[1], .deferred, .deferred)
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let result = try await sut(arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialFourArgumentsFunctionFourthArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4, arr[0], arr[1], arr[2], .deferred)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, sut(arr[3]))
    }

    func test_throws_partialFourArgumentsFunctionFourthArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(f4t, arr[0], arr[1], arr[2], .deferred)
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try sut(arr[3]))
    }

    func test_async_partialFourArgumentsFunctionFourthArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4, arr[0], arr[1], arr[2], .deferred)
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let result = await sut(arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFourArgumentsFunctionFourthArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 4)
        let sut = partial(aF4T, arr[0], arr[1], arr[2], .deferred)
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let result = try await sut(arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFirstArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, .deferred, arr[1], arr[2], arr[3], arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[0]))
    }

    func test_throws_partialFiveArgumentsFunctionFirstArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, .deferred, arr[1], arr[2], arr[3], arr[4])
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[0]))
    }

    func test_async_partialFiveArgumentsFunctionFirstArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, .deferred, arr[1], arr[2], arr[3], arr[4])
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[0])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFirstArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, .deferred, arr[1], arr[2], arr[3], arr[4])
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[0])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFirstSecondArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, .deferred, .deferred, arr[2], arr[3], arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[0], arr[1]))
    }

    func test_throws_partialFiveArgumentsFunctionFirstSecondArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, .deferred, .deferred, arr[2], arr[3], arr[4])
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[0], arr[1]))
    }

    func test_async_partialFiveArgumentsFunctionFirstSecondArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, .deferred, .deferred, arr[2], arr[3], arr[4])
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[0], arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFirstSecondArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, .deferred, .deferred, arr[2], arr[3], arr[4])
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[0], arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFirstSecondThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, .deferred, .deferred, .deferred, arr[3], arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[0], arr[1], arr[2]))
    }

    func test_throws_partialFiveArgumentsFunctionFirstSecondThirdArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, .deferred, .deferred, .deferred, arr[3], arr[4])
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[0], arr[1], arr[2]))
    }

    func test_async_partialFiveArgumentsFunctionFirstSecondThirdArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, .deferred, .deferred, .deferred, arr[3], arr[4])
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFirstSecondThirdArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, .deferred, .deferred, .deferred, arr[3], arr[4])
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFirstSecondFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, .deferred, .deferred, arr[2], .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[0], arr[1], arr[3]))
    }

    func test_throws_partialFiveArgumentsFunctionFirstSecondFourthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, .deferred, .deferred, arr[2], .deferred, arr[4])
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[0], arr[1], arr[3]))
    }

    func test_async_partialFiveArgumentsFunctionFirstSecondFourthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, .deferred, .deferred, arr[2], .deferred, arr[4])
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[0], arr[1], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFirstSecondFourthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, .deferred, .deferred, arr[2], .deferred, arr[4])
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[0], arr[1], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFirstThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, .deferred, arr[1], .deferred, arr[3], arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[0], arr[2]))
    }

    func test_throws_partialFiveArgumentsFunctionFirstThirdArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, .deferred, arr[1], .deferred, arr[3], arr[4])
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[0], arr[2]))
    }

    func test_async_partialFiveArgumentsFunctionFirstThirdArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, .deferred, arr[1], .deferred, arr[3], arr[4])
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[0], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFirstThirdArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, .deferred, arr[1], .deferred, arr[3], arr[4])
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[0], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFirstThirdFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, .deferred, arr[1], .deferred, .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[0], arr[2], arr[3]))
    }

    func test_throws_partialFiveArgumentsFunctionFirstThirdFourthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, .deferred, arr[1], .deferred, .deferred, arr[4])
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[0], arr[2], arr[3]))
    }

    func test_async_partialFiveArgumentsFunctionFirstThirdFourthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, .deferred, arr[1], .deferred, .deferred, arr[4])
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[0], arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFirstThirdFourthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, .deferred, arr[1], .deferred, .deferred, arr[4])
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[0], arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFirstFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, .deferred, arr[1], arr[2], .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[0], arr[3]))
    }

    func test_throws_partialFiveArgumentsFunctionFirstFourthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, .deferred, arr[1], arr[2], .deferred, arr[4])
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[0], arr[3]))
    }

    func test_async_partialFiveArgumentsFunctionFirstFourthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, .deferred, arr[1], arr[2], .deferred, arr[4])
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[0], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFirstFourthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, .deferred, arr[1], arr[2], .deferred, arr[4])
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[0], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionSecondArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, arr[0], .deferred, arr[2], arr[3], arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[1]))
    }

    func test_throws_partialFiveArgumentsFunctionSecondArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, arr[0], .deferred, arr[2], arr[3], arr[4])
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[1]))
    }

    func test_async_partialFiveArgumentsFunctionSecondArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, arr[0], .deferred, arr[2], arr[3], arr[4])
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionSecondArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, arr[0], .deferred, arr[2], arr[3], arr[4])
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionSecondThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, arr[0], .deferred, .deferred, arr[3], arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[1], arr[2]))
    }

    func test_throws_partialFiveArgumentsFunctionSecondThirdArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, arr[0], .deferred, .deferred, arr[3], arr[4])
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[1], arr[2]))
    }

    func test_async_partialFiveArgumentsFunctionSecondThirdArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, arr[0], .deferred, .deferred, arr[3], arr[4])
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[1], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionSecondThirdArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, arr[0], .deferred, .deferred, arr[3], arr[4])
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[1], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionSecondThirdFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, arr[0], .deferred, .deferred, .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[1], arr[2], arr[3]))
    }

    func test_throws_partialFiveArgumentsFunctionSecondThirdFourthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, arr[0], .deferred, .deferred, .deferred, arr[4])
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[1], arr[2], arr[3]))
    }

    func test_async_partialFiveArgumentsFunctionSecondThirdFourthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, arr[0], .deferred, .deferred, .deferred, arr[4])
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionSecondThirdFourthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, arr[0], .deferred, .deferred, .deferred, arr[4])
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFirstSecondThirdFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, .deferred, .deferred, .deferred, .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[0], arr[1], arr[2], arr[3]))
    }

    func test_throws_partialFiveArgumentsFunctionFirstSecondThirdFourthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, .deferred, .deferred, .deferred, .deferred, arr[4])
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[0], arr[1], arr[2], arr[3]))
    }

    func test_async_partialFiveArgumentsFunctionFirstSecondThirdFourthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, .deferred, .deferred, .deferred, .deferred, arr[4])
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFirstSecondThirdFourthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, .deferred, .deferred, .deferred, .deferred, arr[4])
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionSecondFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, arr[0], .deferred, arr[2], .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[1], arr[3]))
    }

    func test_throws_partialFiveArgumentsFunctionSecondFourthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, arr[0], .deferred, arr[2], .deferred, arr[4])
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[1], arr[3]))
    }

    func test_async_partialFiveArgumentsFunctionSecondFourthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, arr[0], .deferred, arr[2], .deferred, arr[4])
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[1], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionSecondFourthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, arr[0], .deferred, arr[2], .deferred, arr[4])
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[1], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionThirdArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, arr[0], arr[1], .deferred, arr[3], arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[2]))
    }

    func test_throws_partialFiveArgumentsFunctionThirdArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, arr[0], arr[1], .deferred, arr[3], arr[4])
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[2]))
    }

    func test_async_partialFiveArgumentsFunctionThirdArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, arr[0], arr[1], .deferred, arr[3], arr[4])
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionThirdArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, arr[0], arr[1], .deferred, arr[3], arr[4])
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionThirdFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, arr[0], arr[1], .deferred, .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[2], arr[3]))
    }

    func test_throws_partialFiveArgumentsFunctionThirdFourthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, arr[0], arr[1], .deferred, .deferred, arr[4])
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[2], arr[3]))
    }

    func test_async_partialFiveArgumentsFunctionThirdFourthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, arr[0], arr[1], .deferred, .deferred, arr[4])
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionThirdFourthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, arr[0], arr[1], .deferred, .deferred, arr[4])
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFourthArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, arr[0], arr[1], arr[2], .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[3]))
    }

    func test_throws_partialFiveArgumentsFunctionFourthArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, arr[0], arr[1], arr[2], .deferred, arr[4])
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[3]))
    }

    func test_async_partialFiveArgumentsFunctionFourthArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, arr[0], arr[1], arr[2], .deferred, arr[4])
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFourthArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, arr[0], arr[1], arr[2], .deferred, arr[4])
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFirstFifthArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, .deferred, arr[1], arr[2], arr[3], .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[0], arr[4]))
    }

    func test_throws_partialFiveArgumentsFunctionFirstFifthArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, .deferred, arr[1], arr[2], arr[3], .deferred)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[0], arr[4]))
    }

    func test_async_partialFiveArgumentsFunctionFirstFifthArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, .deferred, arr[1], arr[2], arr[3], .deferred)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[0], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFirstFifthArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, .deferred, arr[1], arr[2], arr[3], .deferred)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[0], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFirstSecondFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, .deferred, .deferred, arr[2], arr[3], .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[0], arr[1], arr[4]))
    }

    func test_throws_partialFiveArgumentsFunctionFirstSecondFifthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, .deferred, .deferred, arr[2], arr[3], .deferred)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[0], arr[1], arr[4]))
    }

    func test_async_partialFiveArgumentsFunctionFirstSecondFifthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, .deferred, .deferred, arr[2], arr[3], .deferred)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let resutl = await sut(arr[0], arr[1], arr[4])
        XCTAssertEqual(expected, resutl)
    }

    func test_async_throws_partialFiveArgumentsFunctionFirstSecondFifthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, .deferred, .deferred, arr[2], arr[3], .deferred)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let resutl = try await sut(arr[0], arr[1], arr[4])
        XCTAssertEqual(expected, resutl)
    }

    func test_partialFiveArgumentsFunctionFirstSecondThirdFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, .deferred, .deferred, .deferred, arr[3], .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[0], arr[1], arr[2], arr[4]))
    }

    func test_throws_partialFiveArgumentsFunctionFirstSecondThirdFifthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, .deferred, .deferred, .deferred, arr[3], .deferred)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[0], arr[1], arr[2], arr[4]))
    }

    func test_async_partialFiveArgumentsFunctionFirstSecondThirdFifthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, .deferred, .deferred, .deferred, arr[3], .deferred)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[0], arr[1], arr[2], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFirstSecondThirdFifthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, .deferred, .deferred, .deferred, arr[3], .deferred)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[0], arr[1], arr[2], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFirstSecondFourthFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, .deferred, .deferred, arr[2], .deferred, .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[0], arr[1], arr[3], arr[4]))
    }

    func test_throws_partialFiveArgumentsFunctionFirstSecondFourthFifthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, .deferred, .deferred, arr[2], .deferred, .deferred)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[0], arr[1], arr[3], arr[4]))
    }

    func test_async_partialFiveArgumentsFunctionFirstSecondFourthFifthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, .deferred, .deferred, arr[2], .deferred, .deferred)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[0], arr[1], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFirstSecondFourthFifthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, .deferred, .deferred, arr[2], .deferred, .deferred)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[0], arr[1], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFirstThirdFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, .deferred, arr[1], .deferred, arr[3], .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[0], arr[2], arr[4]))
    }

    func test_throws_partialFiveArgumentsFunctionFirstThirdFifthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, .deferred, arr[1], .deferred, arr[3], .deferred)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[0], arr[2], arr[4]))
    }

    func test_async_partialFiveArgumentsFunctionFirstThirdFifthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, .deferred, arr[1], .deferred, arr[3], .deferred)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[0], arr[2], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFirstThirdFifthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, .deferred, arr[1], .deferred, arr[3], .deferred)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[0], arr[2], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFirstThirdFourthFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, .deferred, arr[1], .deferred, .deferred, .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[0], arr[2], arr[3], arr[4]))
    }

    func test_throws_partialFiveArgumentsFunctionFirstThirdFourthFifthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, .deferred, arr[1], .deferred, .deferred, .deferred)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[0], arr[2], arr[3], arr[4]))
    }

    func test_async_partialFiveArgumentsFunctionFirstThirdFourthFifthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, .deferred, arr[1], .deferred, .deferred, .deferred)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[0], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFirstThirdFourthFifthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, .deferred, arr[1], .deferred, .deferred, .deferred)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[0], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFirstFourthFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, .deferred, arr[1], arr[2], .deferred, .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[0], arr[3], arr[4]))
    }

    func test_throws_partialFiveArgumentsFunctionFirstFourthFifthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, .deferred, arr[1], arr[2], .deferred, .deferred)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[0], arr[3], arr[4]))
    }

    func test_async_partialFiveArgumentsFunctionFirstFourthFifthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, .deferred, arr[1], arr[2], .deferred, .deferred)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[0], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFirstFourthFifthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, .deferred, arr[1], arr[2], .deferred, .deferred)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[0], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionSecondFifthArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, arr[0], .deferred, arr[2], arr[3], .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[1], arr[4]))
    }

    func test_throws_partialFiveArgumentsFunctionSecondFifthArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, arr[0], .deferred, arr[2], arr[3], .deferred)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[1], arr[4]))
    }

    func test_async_partialFiveArgumentsFunctionSecondFifthArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, arr[0], .deferred, arr[2], arr[3], .deferred)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[1], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionSecondFifthArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, arr[0], .deferred, arr[2], arr[3], .deferred)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[1], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionSecondThirdFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, arr[0], .deferred, .deferred, arr[3], .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[1], arr[2], arr[4]))
    }

    func test_throws_partialFiveArgumentsFunctionSecondThirdFifthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, arr[0], .deferred, .deferred, arr[3], .deferred)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[1], arr[2], arr[4]))
    }

    func test_async_partialFiveArgumentsFunctionSecondThirdFifthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, arr[0], .deferred, .deferred, arr[3], .deferred)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[1], arr[2], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionSecondThirdFifthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, arr[0], .deferred, .deferred, arr[3], .deferred)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[1], arr[2], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionSecondThirdFourthFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, arr[0], .deferred, .deferred, .deferred, .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[1], arr[2], arr[3], arr[4]))
    }

    func test_throws_partialFiveArgumentsFunctionSecondThirdFourthFifthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, arr[0], .deferred, .deferred, .deferred, .deferred)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[1], arr[2], arr[3], arr[4]))
    }

    func test_async_partialFiveArgumentsFunctionSecondThirdFourthFifthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, arr[0], .deferred, .deferred, .deferred, .deferred)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionSecondThirdFourthFifthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, arr[0], .deferred, .deferred, .deferred, .deferred)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionSecondFourthFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, arr[0], .deferred, arr[2], .deferred, .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[1], arr[3], arr[4]))
    }

    func test_throws_partialFiveArgumentsFunctionSecondFourthFifthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, arr[0], .deferred, arr[2], .deferred, .deferred)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[1], arr[3], arr[4]))
    }

    func test_async_partialFiveArgumentsFunctionSecondFourthFifthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, arr[0], .deferred, arr[2], .deferred, .deferred)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[1], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionSecondFourthFifthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, arr[0], .deferred, arr[2], .deferred, .deferred)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[1], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionThirdFifthArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, arr[0], arr[1], .deferred, arr[3], .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[2], arr[4]))
    }

    func test_throws_partialFiveArgumentsFunctionThirdFifthArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, arr[0], arr[1], .deferred, arr[3], .deferred)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[2], arr[4]))
    }

    func test_async_partialFiveArgumentsFunctionThirdFifthArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, arr[0], arr[1], .deferred, arr[3], .deferred)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[2], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionThirdFifthArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, arr[0], arr[1], .deferred, arr[3], .deferred)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[2], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionThirdFourthFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, arr[0], arr[1], .deferred, .deferred, .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[2], arr[3], arr[4]))
    }

    func test_throws_partialFiveArgumentsFunctionThirdFourthFifthArgumentsDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, arr[0], arr[1], .deferred, .deferred, .deferred)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[2], arr[3], arr[4]))
    }

    func test_async_partialFiveArgumentsFunctionThirdFourthFifthArgumentsDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, arr[0], arr[1], .deferred, .deferred, .deferred)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionThirdFourthFifthArgumentsDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, arr[0], arr[1], .deferred, .deferred, .deferred)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_partialFiveArgumentsFunctionFourthFifthArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5, arr[0], arr[1], arr[2], .deferred, .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, sut(arr[3], arr[4]))
    }

    func test_throws_partialFiveArgumentsFunctionFourthFifthArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(f5t, arr[0], arr[1], arr[2], .deferred, .deferred)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try sut(arr[3], arr[4]))
    }

    func test_async_partialFiveArgumentsFunctionFourthFifthArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5, arr[0], arr[1], arr[2], .deferred, .deferred)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = await sut(arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialFiveArgumentsFunctionFourthFifthArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let sut = partial(aF5T, arr[0], arr[1], arr[2], .deferred, .deferred)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let result = try await sut(arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction12345ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, arr[0], .deferred, .deferred, .deferred, .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[1], arr[2], arr[3], arr[4], arr[5]))
    }

    func test_throws_partialSixArgumentsFunction12345ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, arr[0], .deferred, .deferred, .deferred, .deferred, .deferred)
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[1], arr[2], arr[3], arr[4], arr[5]))
    }

    func test_async_partialSixArgumentsFunction12345ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, arr[0], .deferred, .deferred, .deferred, .deferred, .deferred)
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction12345ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, arr[0], .deferred, .deferred, .deferred, .deferred, .deferred)
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction02345ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, .deferred, arr[1], .deferred, .deferred, .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[0], arr[2], arr[3], arr[4], arr[5]))
    }

    func test_throws_partialSixArgumentsFunction02345ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, .deferred, arr[1], .deferred, .deferred, .deferred, .deferred)
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[0], arr[2], arr[3], arr[4], arr[5]))
    }

    func test_async_partialSixArgumentsFunction02345ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, .deferred, arr[1], .deferred, .deferred, .deferred, .deferred)
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[0], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction02345ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, .deferred, arr[1], .deferred, .deferred, .deferred, .deferred)
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[0], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction01345ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, .deferred, .deferred, arr[2], .deferred, .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[0], arr[1], arr[3], arr[4], arr[5]))
    }

    func test_throws_partialSixArgumentsFunction01345ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, .deferred, .deferred, arr[2], .deferred, .deferred, .deferred)
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[0], arr[1], arr[3], arr[4], arr[5]))
    }

    func test_async_partialSixArgumentsFunction01345ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, .deferred, .deferred, arr[2], .deferred, .deferred, .deferred)
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[0], arr[1], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction01345ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, .deferred, .deferred, arr[2], .deferred, .deferred, .deferred)
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[0], arr[1], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction01245ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, .deferred, .deferred, .deferred, arr[3], .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[0], arr[1], arr[2], arr[4], arr[5]))
    }

    func test_throws_partialSixArgumentsFunction01245ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, .deferred, .deferred, .deferred, arr[3], .deferred, .deferred)
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[0], arr[1], arr[2], arr[4], arr[5]))
    }

    func test_async_partialSixArgumentsFunction01245ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, .deferred, .deferred, .deferred, arr[3], .deferred, .deferred)
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[0], arr[1], arr[2], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction01245ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, .deferred, .deferred, .deferred, arr[3], .deferred, .deferred)
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[0], arr[1], arr[2], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction01235ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, .deferred, .deferred, .deferred, .deferred, arr[4], .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[0], arr[1], arr[2], arr[3], arr[5]))
    }

    func test_throws_partialSixArgumentsFunction01235ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, .deferred, .deferred, .deferred, .deferred, arr[4], .deferred)
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[0], arr[1], arr[2], arr[3], arr[5]))
    }

    func test_async_partialSixArgumentsFunction01235ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, .deferred, .deferred, .deferred, .deferred, arr[4], .deferred)
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[0], arr[1], arr[2], arr[3], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction01235ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, .deferred, .deferred, .deferred, .deferred, arr[4], .deferred)
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[0], arr[1], arr[2], arr[3], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction01234ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, .deferred, .deferred, .deferred, .deferred, .deferred, arr[5])
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[0], arr[1], arr[2], arr[3], arr[4]))
    }

    func test_throws_partialSixArgumentsFunction01234ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, .deferred, .deferred, .deferred, .deferred, .deferred, arr[5])
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[0], arr[1], arr[2], arr[3], arr[4]))
    }

    func test_async_partialSixArgumentsFunction01234ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, .deferred, .deferred, .deferred, .deferred, .deferred, arr[5])
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction01234ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, .deferred, .deferred, .deferred, .deferred, .deferred, arr[5])
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction2345ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, arr[0], arr[1], .deferred, .deferred, .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[2], arr[3], arr[4], arr[5]))
    }

    func test_throws_partialSixArgumentsFunction2345ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, arr[0], arr[1], .deferred, .deferred, .deferred, .deferred)
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[2], arr[3], arr[4], arr[5]))
    }

    func test_async_partialSixArgumentsFunction2345ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, arr[0], arr[1], .deferred, .deferred, .deferred, .deferred)
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction2345ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, arr[0], arr[1], .deferred, .deferred, .deferred, .deferred)
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction0345ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, .deferred, arr[1], arr[2], .deferred, .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[0], arr[3], arr[4], arr[5]))
    }

    func test_throws_partialSixArgumentsFunction0345ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, .deferred, arr[1], arr[2], .deferred, .deferred, .deferred)
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[0], arr[3], arr[4], arr[5]))
    }

    func test_async_partialSixArgumentsFunction0345ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, .deferred, arr[1], arr[2], .deferred, .deferred, .deferred)
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[0], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction0345ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, .deferred, arr[1], arr[2], .deferred, .deferred, .deferred)
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[0], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction0145ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, .deferred, .deferred, arr[2], arr[3], .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[0], arr[1], arr[4], arr[5]))
    }

    func test_throws_partialSixArgumentsFunction0145ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, .deferred, .deferred, arr[2], arr[3], .deferred, .deferred)
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[0], arr[1], arr[4], arr[5]))
    }

    func test_async_partialSixArgumentsFunction0145ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, .deferred, .deferred, arr[2], arr[3], .deferred, .deferred)
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[0], arr[1], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction0145ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, .deferred, .deferred, arr[2], arr[3], .deferred, .deferred)
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[0], arr[1], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction0125ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, .deferred, .deferred, .deferred, arr[3], arr[4], .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[0], arr[1], arr[2], arr[5]))
    }

    func test_throws_partialSixArgumentsFunction0125ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, .deferred, .deferred, .deferred, arr[3], arr[4], .deferred)
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[0], arr[1], arr[2], arr[5]))
    }

    func test_async_partialSixArgumentsFunction0125ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, .deferred, .deferred, .deferred, arr[3], arr[4], .deferred)
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[0], arr[1], arr[2], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction0125ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, .deferred, .deferred, .deferred, arr[3], arr[4], .deferred)
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[0], arr[1], arr[2], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction0123ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, .deferred, .deferred, .deferred, .deferred, arr[4], arr[5])
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[0], arr[1], arr[2], arr[3]))
    }

    func test_throws_partialSixArgumentsFunction0123ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, .deferred, .deferred, .deferred, .deferred, arr[4], arr[5])
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[0], arr[1], arr[2], arr[3]))
    }

    func test_async_partialSixArgumentsFunction0123ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, .deferred, .deferred, .deferred, .deferred, arr[4], arr[5])
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction0123ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, .deferred, .deferred, .deferred, .deferred, arr[4], arr[5])
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction345ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, arr[0], arr[1], arr[2], .deferred, .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[3], arr[4], arr[5]))
    }

    func test_throws_partialSixArgumentsFunction345ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, arr[0], arr[1], arr[2], .deferred, .deferred, .deferred)
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[3], arr[4], arr[5]))
    }

    func test_async_partialSixArgumentsFunction345ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, arr[0], arr[1], arr[2], .deferred, .deferred, .deferred)
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction345ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, arr[0], arr[1], arr[2], .deferred, .deferred, .deferred)
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction45ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, arr[0], arr[1], arr[2], arr[3], .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[4], arr[5]))
    }

    func test_throws_partialSixArgumentsFunction45ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, arr[0], arr[1], arr[2], arr[3], .deferred, .deferred)
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[4], arr[5]))
    }

    func test_async_partialSixArgumentsFunction45ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, arr[0], arr[1], arr[2], arr[3], .deferred, .deferred)
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction45ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, arr[0], arr[1], arr[2], arr[3], .deferred, .deferred)
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[4], arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction5ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, arr[0], arr[1], arr[2], arr[3], arr[4], .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[5]))
    }

    func test_throws_partialSixArgumentsFunction5ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, arr[0], arr[1], arr[2], arr[3], arr[4], .deferred)
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[5]))
    }

    func test_async_partialSixArgumentsFunction5ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, arr[0], arr[1], arr[2], arr[3], arr[4], .deferred)
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction5ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, arr[0], arr[1], arr[2], arr[3], arr[4], .deferred)
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction4ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, arr[0], arr[1], arr[2], arr[3], .deferred, arr[5])
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[4]))
    }

    func test_throws_partialSixArgumentsFunction4ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, arr[0], arr[1], arr[2], arr[3], .deferred, arr[5])
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[4]))
    }

    func test_async_partialSixArgumentsFunction4ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, arr[0], arr[1], arr[2], arr[3], .deferred, arr[5])
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction4ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, arr[0], arr[1], arr[2], arr[3], .deferred, arr[5])
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction3ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, arr[0], arr[1], arr[2], .deferred, arr[4], arr[5])
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[3]))
    }

    func test_throws_partialSixArgumentsFunction3ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, arr[0], arr[1], arr[2], .deferred, arr[4], arr[5])
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[3]))
    }

    func test_async_partialSixArgumentsFunction3ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, arr[0], arr[1], arr[2], .deferred, arr[4], arr[5])
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction3ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, arr[0], arr[1], arr[2], .deferred, arr[4], arr[5])
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction2ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, arr[0], arr[1], .deferred, arr[3], arr[4], arr[5])
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[2]))
    }

    func test_throws_partialSixArgumentsFunction2ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, arr[0], arr[1], .deferred, arr[3], arr[4], arr[5])
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[2]))
    }

    func test_async_partialSixArgumentsFunction2ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, arr[0], arr[1], .deferred, arr[3], arr[4], arr[5])
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction2ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, arr[0], arr[1], .deferred, arr[3], arr[4], arr[5])
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction1ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, arr[0], .deferred, arr[2], arr[3], arr[4], arr[5])
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[1]))
    }

    func test_throws_partialSixArgumentsFunction1ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, arr[0], .deferred, arr[2], arr[3], arr[4], arr[5])
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[1]))
    }

    func test_async_partialSixArgumentsFunction1ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, arr[0], .deferred, arr[2], arr[3], arr[4], arr[5])
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction1ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, arr[0], .deferred, arr[2], arr[3], arr[4], arr[5])
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_partialSixArgumentsFunction0ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6, .deferred, arr[1], arr[2], arr[3], arr[4], arr[5])
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, sut(arr[0]))
    }

    func test_throws_partialSixArgumentsFunction0ArgumentDeferred_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(f6T, .deferred, arr[1], arr[2], arr[3], arr[4], arr[5])
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try sut(arr[0]))
    }

    func test_async_partialSixArgumentsFunction0ArgumentDeferred_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6, .deferred, arr[1], arr[2], arr[3], arr[4], arr[5])
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = await sut(arr[0])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_partialSixArgumentsFunction0ArgumentDeferred_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let sut = partial(aF6T, .deferred, arr[1], arr[2], arr[3], arr[4], arr[5])
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let result = try await sut(arr[0])
        XCTAssertEqual(expected, result)
    }
}
