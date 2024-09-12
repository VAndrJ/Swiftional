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

    func test_constantVoidFunction_returnValueSameWithConstantInput() {
        let arr = generateTestIntArray(length: 1)
        let input = arr[0]
        let f: () -> Int = constant(input)
        XCTAssertEqual(input, f())
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

    func test_async_flipFunction_argumentsFlipped() async {
        let f: @Sendable (String, Int) async -> String = { $0 + "\($1)" }
        let firstArgument = "Test"
        let secondArgument = generateTestIntArray(length: 1)[0]
        let expected = await f(firstArgument, secondArgument)
        await aXCTAssertEqual(expected, await flip(f)(secondArgument, firstArgument))
    }

    func test_throws_flipFunction_argumentsFlipped() throws {
        let f: (String, Int) throws -> String = { $0 + "\($1)" }
        let firstArgument = "Test"
        let secondArgument = generateTestIntArray(length: 1)[0]
        let expected = try f(firstArgument, secondArgument)
        XCTAssertEqual(expected, try flip(f)(secondArgument, firstArgument))
    }

    func test_async_throws_flipFunction_argumentsFlipped() async throws {
        let f: @Sendable (String, Int) async throws -> String = { $0 + "\($1)" }
        let firstArgument = "Test"
        let secondArgument = generateTestIntArray(length: 1)[0]
        let expected = try await f(firstArgument, secondArgument)
        try await aXCTAssertEqual(expected, try await flip(f)(secondArgument, firstArgument))
    }

    func test_withFunction_closureApplied() {
        let input = 2
        let expected = getString(input)
        XCTAssertEqual(expected, with(input, getString))
    }

    func test_async_withFunction_closureApplied() async {
        let input = 2
        let expected = await aGetString(input)
        await aXCTAssertEqual(expected, await with(input, aGetString))
    }
    
    func test_ignoredFunction() {
        let expected = "expected"
        var result = ""

        func assignExpectedToResult() -> Bool {
            result = expected
            return true
        }

        ignored(assignExpectedToResult)()
        XCTAssertEqual(expected, result)
    }

    func test_async_ignoredFunction() async {
        let expected = "expected"
        let result = Ignored()

        @Sendable
        func assignExpectedToResult() async -> Bool {
            await result.update(result: expected)
            return true
        }

        await ignored(assignExpectedToResult)()
        await aXCTAssertEqual(expected, await result.result)
    }
}

private actor Ignored {
    var result = ""

    func update(result: String) {
        self.result = result
    }
}
