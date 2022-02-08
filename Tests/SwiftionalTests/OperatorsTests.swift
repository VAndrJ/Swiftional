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

    func test_pipeBackward_sameResult() {
        let input = 2
        let expected = mul(input)
        let result = mul <| input
        XCTAssertEqual(expected, result)
    }

    func test_pipeBackwardThrowing_sameResult() throws {
        let input = 2
        let expected = try mult(input)
        let result = try mult <| input
        XCTAssertEqual(expected, result)
    }

    func test_functionComposition_argumentApplyResult() {
        let input = 2
        let expected = getString(mul(input))
        let mulString = mul >>> getString
        XCTAssertEqual(expected, mulString(input))
    }

    func test_functionVoidComposition_argumentApplyResult() {
        let expected = getString(getInt())
        let intString = getInt >>> getString
        XCTAssertEqual(expected, intString())
    }

    func test_functionVoidCompositionFirstThrowable_argumentApplyResult() throws {
        let expected = getString(try getIntt())
        let intString = getIntt >>> getString
        XCTAssertEqual(expected, try intString())
    }

    func test_functionVoidCompositionSecondThrowable_argumentApplyResult() throws {
        let expected = try mult(getInt())
        let intMul = getInt >>> mult
        XCTAssertEqual(expected, try intMul())
    }

    func test_functionVoidCompositionFirstSecondThrowable_argumentApplyResult() throws {
        let expected = try mult(try getIntt())
        let intMul = getIntt >>> mult
        XCTAssertEqual(expected, try intMul())
    }

    func test_functionCompositionFirstThrowable_argumentApplyResult() throws {
        let input = 2
        let expected = getString(try mult(input))
        let mulString = mult >>> getString
        XCTAssertEqual(expected, try mulString(input))
    }

    func test_functionCompositionSecondThrowable_argumentApplyResult() throws {
        let input = 2
        let expected = try mult(mul(input))
        let mulString = mul >>> mult
        XCTAssertEqual(expected, try mulString(2))
    }

    func test_functionCompositionFirstSecondThrowable_argumentApplyResult() throws {
        let input = 2
        let expected = try mult(try mult(input))
        let multMult = mult >>> mult
        XCTAssertEqual(expected, try multMult(input))
    }

    func test_functionCompositionBackward_argumentApplyResult() {
        let input = 2
        let expected = getString(mul(input))
        let mulString = getString <<< mul
        XCTAssertEqual(expected, mulString(input))
    }

    func test_functionVoidCompositionBackward_argumentApplyResult() {
        let expected = getString(getInt())
        let intString = getString <<< getInt
        XCTAssertEqual(expected, intString())
    }

    func test_functionVoidCompositionBackwardFirstThrowable_argumentApplyResult() throws {
        let expected = getString(try getIntt())
        let intString = getString <<< getIntt
        XCTAssertEqual(expected, try intString())
    }

    func test_functionVoidCompositionBackwardSecondThrowable_argumentApplyResult() throws {
        let expected = try mult(getInt())
        let intMul = mult <<< getInt
        XCTAssertEqual(expected, try intMul())
    }

    func test_functionVoidCompositionBackwardFirstSecondThrowable_argumentApplyResult() throws {
        let expected = try mult(try getIntt())
        let intMul = mult <<< getIntt
        XCTAssertEqual(expected, try intMul())
    }

    func test_functionCompositionBackwardFirstThrowable_argumentApplyResult() throws {
        let input = 2
        let expected = getString(try mult(input))
        let mulString = getString <<< mult
        XCTAssertEqual(expected, try mulString(input))
    }

    func test_functionCompositionBackwardSecondThrowable_argumentApplyResult() throws {
        let input = 2
        let expected = try mult(mul(input))
        let mulString = mult <<< mul
        XCTAssertEqual(expected, try mulString(2))
    }

    func test_functionCompositionBackwardFirstSecondThrowable_argumentApplyResult() throws {
        let input = 2
        let expected = try mult(try mult(input))
        let multMult = mult <<< mult
        XCTAssertEqual(expected, try multMult(input))
    }
}
