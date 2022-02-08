//
//  OperatorsTests.swift
//  
//
//  Created by Volodymyr Andriienko on 08.02.2022.
//

import XCTest
@testable import Swiftional

class OperatorsTest: XCTestCase {

    func test_pipeForwardOneArgument_sameResult() {
        let input = 2
        let expected = mul(input)
        let result = input |> mul
        XCTAssertEqual(expected, result)
    }

    func test_pipeForwardOneArgumentThrows_sameResult() throws {
        let input = 2
        let expected = try mult(input)
        let result = try input |> mult
        XCTAssertEqual(expected, result)
    }

    func test_pipeForwardTwoArguments_sameResult() {
        let input = 2
        let expected = f2(input, 2)
        let result = input |> f2
        XCTAssertEqual(expected, result(input))
    }

    func test_pipeForwardTwoArgumentsThrowing_sameResult() throws {
        let input = 2
        let expected = try f2t(input, 2)
        let result = input |> f2t
        XCTAssertEqual(expected, try result(input))
    }

    func test_pipeForwardThreeArguments_sameResult() {
        let input = 2
        let expected = f3(input, 1, 1)
        let result = input |> f3
        XCTAssertEqual(expected, result(1, 1))
    }

    func test_pipeForwardThreeArgumentsThrowing_sameResult() throws {
        let input = 2
        let expected = try f3t(input, 1, 1)
        let result = input |> f3t
        XCTAssertEqual(expected, try result(1, 1))
    }

    func test_pipeForwardFourArguments_sameResult() {
        let input = 2
        let expected = f4(input, 1, 1, 1)
        let result = input |> f4
        XCTAssertEqual(expected, result(1, 1, 1))
    }

    func test_pipeForwardFourArgumentsThrowing_sameResult() throws {
        let input = 2
        let expected = try f4t(input, 1, 1, 1)
        let result = input |> f4t
        XCTAssertEqual(expected, try result(1, 1, 1))
    }

    func test_pipeForwardFiveArguments_sameResult() {
        let input = 2
        let expected = f5(input, 1, 1, 1, 1)
        let result = input |> f5
        XCTAssertEqual(expected, result(1, 1, 1, 1))
    }

    func test_pipeForwardFiveArgumentsThrowing_sameResult() throws {
        let input = 2
        let expected = try f5t(input, 1, 1, 1, 1)
        let result = input |> f5t
        XCTAssertEqual(expected, try result(1, 1, 1, 1))
    }
}
