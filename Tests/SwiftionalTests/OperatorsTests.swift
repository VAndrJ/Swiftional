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
        let input = getIntInput()
        let expected = mul(input)
        let result = input |> mul
        XCTAssertEqual(expected, result)
    }

    func test_async_pipeForwardOneArgument_sameResult() async {
        let input = getIntInput()
        let expected = await aMul(input)
        let result = await input |> aMul(_:)
        XCTAssertEqual(expected, result)
    }

    func test_pipeForwardOneArgumentThrows_sameResult() throws {
        let input = getIntInput()
        let expected = try mulT(input)
        let result = try input |> mulT
        XCTAssertEqual(expected, result)
    }

    func test_async_pipeForwardOneArgumentThrows_sameResult() async throws {
        let input = getIntInput()
        let expected = try await aMulT(input)
        let result = try await input |> aMulT
        XCTAssertEqual(expected, result)
    }

    func test_pipeForwardTwoArguments_sameResult() {
        let input = getIntInput()
        let expected = f2(input, 2)
        let result = input |> f2
        XCTAssertEqual(expected, result(2))
    }

    func test_async_pipeForwardTwoArguments_sameResult() async {
        let input = getIntInput()
        let expected = await aF2(input, 2)
        let sut = input |> aF2
        let result = await sut(2)
        XCTAssertEqual(expected, result)
    }

    func test_pipeForwardTwoArgumentsThrowing_sameResult() throws {
        let input = getIntInput()
        let expected = try f2t(input, 2)
        let result = input |> f2t
        XCTAssertEqual(expected, try result(2))
    }

    func test_async_pipeForwardTwoArgumentsThrowing_sameResult() async throws {
        let input = getIntInput()
        let expected = try await aF2T(input, 2)
        let sut = input |> aF2T
        let result = try await sut(2)
        XCTAssertEqual(expected, result)
    }

    func test_pipeForwardThreeArguments_sameResult() {
        let input = getIntInput()
        let expected = f3(input, 1, 1)
        let result = input |> f3
        XCTAssertEqual(expected, result(1, 1))
    }

    func test_async_pipeForwardThreeArguments_sameResult() async {
        let input = getIntInput()
        let expected = await aF3(input, 1, 1)
        let sut = input |> aF3
        let result = await sut(1, 1)
        XCTAssertEqual(expected, result)
    }

    func test_pipeForwardThreeArgumentsThrowing_sameResult() throws {
        let input = getIntInput()
        let expected = try f3t(input, 1, 1)
        let result = input |> f3t
        XCTAssertEqual(expected, try result(1, 1))
    }

    func test_async_pipeForwardThreeArgumentsThrowing_sameResult() async throws {
        let input = getIntInput()
        let expected = try await aF3T(input, 1, 1)
        let sut = input |> aF3T
        let result = try await sut(1, 1)
        XCTAssertEqual(expected, result)
    }

    func test_pipeForwardFourArguments_sameResult() {
        let input = getIntInput()
        let expected = f4(input, 1, 1, 1)
        let result = input |> f4
        XCTAssertEqual(expected, result(1, 1, 1))
    }

    func test_async_pipeForwardFourArguments_sameResult() async {
        let input = getIntInput()
        let expected = await aF4(input, 1, 1, 1)
        let sut = input |> aF4
        let result = await sut(1, 1, 1)
        XCTAssertEqual(expected, result)
    }

    func test_pipeForwardFourArgumentsThrowing_sameResult() throws {
        let input = getIntInput()
        let expected = try f4t(input, 1, 1, 1)
        let result = input |> f4t
        XCTAssertEqual(expected, try result(1, 1, 1))
    }

    func test_async_pipeForwardFourArgumentsThrowing_sameResult() async throws {
        let input = getIntInput()
        let expected = try await aF4T(input, 1, 1, 1)
        let sut = input |> aF4T
        let result = try await sut(1, 1, 1)
        XCTAssertEqual(expected, result)
    }

    func test_pipeForwardFiveArguments_sameResult() {
        let input = getIntInput()
        let expected = f5(input, 1, 1, 1, 1)
        let result = input |> f5
        XCTAssertEqual(expected, result(1, 1, 1, 1))
    }

    func test_async_pipeForwardFiveArguments_sameResult() async {
        let input = getIntInput()
        let expected = await aF5(input, 1, 1, 1, 1)
        let sut = input |> aF5
        let result = await sut(1, 1, 1, 1)
        XCTAssertEqual(expected, result)
    }

    func test_pipeForwardFiveArgumentsThrowing_sameResult() throws {
        let input = getIntInput()
        let expected = try f5t(input, 1, 1, 1, 1)
        let result = input |> f5t
        XCTAssertEqual(expected, try result(1, 1, 1, 1))
    }

    func test_async_pipeForwardFiveArgumentsThrowing_sameResult() async throws {
        let input = getIntInput()
        let expected = try await aF5T(input, 1, 1, 1, 1)
        let sut = input |> aF5T
        let result = try await sut(1, 1, 1, 1)
        XCTAssertEqual(expected, result)
    }

    func test_pipeBackward_sameResult() {
        let input = getIntInput()
        let expected = mul(input)
        let result = mul <| input
        XCTAssertEqual(expected, result)
    }

    func test_async_pipeBackward_sameResult() async {
        let input = getIntInput()
        let expected = await aMul(input)
        let result = await aMul <| input
        XCTAssertEqual(expected, result)
    }

    func test_pipeBackwardThrowing_sameResult() throws {
        let input = getIntInput()
        let expected = try mulT(input)
        let result = try mulT <| input
        XCTAssertEqual(expected, result)
    }

    func test_await_pipeBackwardThrowing_sameResult() async throws {
        let input = getIntInput()
        let expected = try await aMulT(input)
        let result = try await aMulT <| input
        XCTAssertEqual(expected, result)
    }

    func test_forwardArgumentApplication_sameResult() {
        let input = getIntInput()
        let expected = mul(input)
        let result = input |>> mul
        XCTAssertEqual(expected, result())
    }

    func test_await_forwardArgumentApplication_sameResult() async {
        let input = getIntInput()
        let expected = await aMul(input)
        let sut = input |>> aMul
        let result = await sut()
        XCTAssertEqual(expected, result)
    }

    func test_backwardArgumentApplication_sameResult() {
        let input = getIntInput()
        let expected = mul(input)
        let result = mul <<| input
        XCTAssertEqual(expected, result())
    }

    func test_async_backwardArgumentApplication_sameResult() async {
        let input = getIntInput()
        let expected = await aMul(input)
        let sut = aMul <<| input
        let result = await sut()
        XCTAssertEqual(expected, result)
    }

    func test_functionVoidComposition_argumentApplyResult() {
        let expected = getString(getInt())
        let intString = getInt >>> getString
        XCTAssertEqual(expected, intString())
    }

    func test_async_1_2_functionVoidComposition_argumentApplyResult() async {
        let expected = await aGetString(aGetInt())
        let sut = aGetInt >>> aGetString
        let result = await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionVoidComposition_argumentApplyResult() async {
        let expected = await aGetString(getInt())
        let sut = getInt >>> aGetString
        let result = await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionVoidComposition_argumentApplyResult() async {
        let expected = await getString(aGetInt())
        let sut = aGetInt >>> getString
        let result = await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_1_2_functionVoidCompositionFirstThrowable_argumentApplyResult() async throws {
        let expected = await aGetString(try aGetIntT())
        let sut = aGetIntT >>> aGetString
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionVoidCompositionFirstThrowable_argumentApplyResult() async throws {
        let expected = await aGetString(try getIntT())
        let sut = getIntT >>> aGetString
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionVoidCompositionFirstThrowable_argumentApplyResult() async throws {
        let expected = await getString(try aGetIntT())
        let sut = aGetIntT >>> getString
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_functionVoidCompositionSecondThrowable_argumentApplyResult() throws {
        let expected = try mulT(getInt())
        let sut = getInt >>> mulT
        XCTAssertEqual(expected, try sut())
    }

    func test_async_1_2_functionVoidCompositionSecondThrowable_argumentApplyResult() async throws {
        let expected = try await aMulT(aGetInt())
        let sut = aGetInt >>> aMulT
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionVoidCompositionSecondThrowable_argumentApplyResult() async throws {
        let expected = try await aMulT(getInt())
        let sut = getInt >>> aMulT
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionVoidCompositionSecondThrowable_argumentApplyResult() async throws {
        let expected = try await mulT(aGetInt())
        let sut = aGetInt >>> mulT
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_functionVoidCompositionFirstSecondThrowable_argumentApplyResult() throws {
        let expected = try mulT(try getIntT())
        let sut = getIntT >>> mulT
        XCTAssertEqual(expected, try sut())
    }

    func test_async_1_2_functionVoidCompositionFirstSecondThrowable_argumentApplyResult() async throws {
        let expected = try await aMulT(try aGetIntT())
        let sut = aGetIntT >>> aMulT
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionVoidCompositionFirstSecondThrowable_argumentApplyResult() async throws {
        let expected = try await aMulT(try getIntT())
        let sut = getIntT >>> aMulT
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionVoidCompositionFirstSecondThrowable_argumentApplyResult() async throws {
        let expected = try await mulT(try aGetIntT())
        let sut = aGetIntT >>> mulT
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_functionComposition_argumentApplyResult() {
        let input = getIntInput()
        let expected = getString(mul(input))
        let sut = mul >>> getString
        XCTAssertEqual(expected, sut(input))
    }

    func test_async_1_2_functionComposition_argumentApplyResult() async {
        let input = getIntInput()
        let expected = await aGetString(aMul(input))
        let sut = aMul >>> aGetString
        let result = await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionComposition_argumentApplyResult() async {
        let input = getIntInput()
        let expected = await aGetString(mul(input))
        let sut = mul >>> aGetString
        let result = await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionComposition_argumentApplyResult() async {
        let input = getIntInput()
        let expected = await getString(aMul(input))
        let sut = aMul >>> getString
        let result = await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_functionCompositionFirstThrowable_argumentApplyResult() throws {
        let input = getIntInput()
        let expected = getString(try mulT(input))
        let sut = mulT >>> getString
        XCTAssertEqual(expected, try sut(input))
    }

    func test_async_1_2_functionCompositionFirstThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = await aGetString(try aMulT(input))
        let sut = aMulT >>> aGetString
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionCompositionFirstThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = await aGetString(try mulT(input))
        let sut = mulT >>> aGetString
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionCompositionFirstThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = await getString(try aMulT(input))
        let sut = aMulT >>> getString
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_functionCompositionSecondThrowable_argumentApplyResult() throws {
        let input = getIntInput()
        let expected = try mulT(mul(input))
        let sut = mul >>> mulT
        XCTAssertEqual(expected, try sut(input))
    }

    func test_async_1_2_functionCompositionSecondThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = try await aMulT(aMul(input))
        let sut = aMul >>> aMulT
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionCompositionSecondThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = try await aMulT(mul(input))
        let sut = mul >>> aMulT
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionCompositionSecondThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = try await mulT(aMul(input))
        let sut = aMul >>> mulT
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_functionCompositionFirstSecondThrowable_argumentApplyResult() throws {
        let input = getIntInput()
        let expected = try mulT(try mulT(input))
        let sut = mulT >>> mulT
        XCTAssertEqual(expected, try sut(input))
    }

    func test_async_1_2_functionCompositionFirstSecondThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = try await aMulT(try aMulT(input))
        let sut = aMulT >>> aMulT
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionCompositionFirstSecondThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = try await aMulT(try mulT(input))
        let sut = mulT >>> aMulT
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionCompositionFirstSecondThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = try await mulT(try aMulT(input))
        let sut = aMulT >>> mulT
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_functionVoidCompositionBackward_argumentApplyResult() {
        let expected = getString(getInt())
        let sut = getString <<< getInt
        XCTAssertEqual(expected, sut())
    }

    func test_async_1_2_functionVoidCompositionBackward_argumentApplyResult() async {
        let expected = await aGetString(aGetInt())
        let sut = aGetString <<< aGetInt
        let result = await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionVoidCompositionBackward_argumentApplyResult() async {
        let expected = await getString(aGetInt())
        let sut = getString <<< aGetInt
        let result = await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionVoidCompositionBackward_argumentApplyResult() async {
        let expected = await aGetString(getInt())
        let sut = aGetString <<< getInt
        let result = await sut()
        XCTAssertEqual(expected, result)
    }

    func test_functionVoidCompositionBackwardSecondThrowable_argumentApplyResult() throws {
        let expected = try mulT(getInt())
        let sut = mulT <<< getInt
        XCTAssertEqual(expected, try sut())
    }

    func test_async_1_2_functionVoidCompositionBackwardSecondThrowable_argumentApplyResult() async throws {
        let expected = try await aMulT(aGetInt())
        let sut = aMulT <<< aGetInt
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionVoidCompositionBackwardSecondThrowable_argumentApplyResult() async throws {
        let expected = try await mulT(aGetInt())
        let sut = mulT <<< aGetInt
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionVoidCompositionBackwardSecondThrowable_argumentApplyResult() async throws {
        let expected = try await aMulT(getInt())
        let sut = aMulT <<< getInt
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_functionVoidCompositionBackwardFirstThrowable_argumentApplyResult() throws {
        let expected = getString(try getIntT())
        let sut = getString <<< getIntT
        XCTAssertEqual(expected, try sut())
    }

    func test_async_1_2_functionVoidCompositionBackwardFirstThrowable_argumentApplyResult() async throws {
        let expected = await aGetString(try aGetIntT())
        let sut = aGetString <<< aGetIntT
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionVoidCompositionBackwardFirstThrowable_argumentApplyResult() async throws {
        let expected = await getString(try aGetIntT())
        let sut = getString <<< aGetIntT
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionVoidCompositionBackwardFirstThrowable_argumentApplyResult() async throws {
        let expected = await aGetString(try getIntT())
        let sut = aGetString <<< getIntT
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_functionVoidCompositionBackwardFirstSecondThrowable_argumentApplyResult() throws {
        let expected = try mulT(try getIntT())
        let sut = mulT <<< getIntT
        XCTAssertEqual(expected, try sut())
    }

    func test_async_1_2_functionVoidCompositionBackwardFirstSecondThrowable_argumentApplyResult() async throws {
        let expected = try await aMulT(try aGetIntT())
        let sut = aMulT <<< aGetIntT
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionVoidCompositionBackwardFirstSecondThrowable_argumentApplyResult() async throws {
        let expected = try await mulT(try aGetIntT())
        let sut = mulT <<< aGetIntT
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionVoidCompositionBackwardFirstSecondThrowable_argumentApplyResult() async throws {
        let expected = try await aMulT(try getIntT())
        let sut = aMulT <<< getIntT
        let result = try await sut()
        XCTAssertEqual(expected, result)
    }

    func test_functionCompositionBackward_argumentApplyResult() {
        let input = getIntInput()
        let expected = getString(mul(input))
        let sut = getString <<< mul
        XCTAssertEqual(expected, sut(input))
    }

    func test_async_1_2_functionCompositionBackward_argumentApplyResult() async {
        let input = getIntInput()
        let expected = await aGetString(aMul(input))
        let sut = aGetString <<< aMul
        let result = await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionCompositionBackward_argumentApplyResult() async {
        let input = getIntInput()
        let expected = await getString(aMul(input))
        let sut = getString <<< aMul
        let result = await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionCompositionBackward_argumentApplyResult() async {
        let input = getIntInput()
        let expected = await aGetString(mul(input))
        let sut = aGetString <<< mul
        let result = await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_functionCompositionBackwardFirstThrowable_argumentApplyResult() throws {
        let input = getIntInput()
        let expected = getString(try mulT(input))
        let sut = getString <<< mulT
        XCTAssertEqual(expected, try sut(input))
    }

    func test_async_1_2_functionCompositionBackwardFirstThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = await aGetString(try aMulT(input))
        let sut = aGetString <<< aMulT
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionCompositionBackwardFirstThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = await getString(try aMulT(input))
        let sut = getString <<< aMulT
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionCompositionBackwardFirstThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = await aGetString(try mulT(input))
        let sut = aGetString <<< mulT
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_functionCompositionBackwardSecondThrowable_argumentApplyResult() throws {
        let input = getIntInput()
        let expected = try mulT(mul(input))
        let sut = mulT <<< mul
        XCTAssertEqual(expected, try sut(input))
    }

    func test_async_1_2_functionCompositionBackwardSecondThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = try await aMulT(aMul(input))
        let sut = aMulT <<< aMul
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionCompositionBackwardSecondThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = try await mulT(aMul(input))
        let sut = mulT <<< aMul
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionCompositionBackwardSecondThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = try await aMulT(mul(input))
        let sut = aMulT <<< mul
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_functionCompositionBackwardFirstSecondThrowable_argumentApplyResult() throws {
        let input = getIntInput()
        let expected = try mulT(try mulT(input))
        let sut = mulT <<< mulT
        XCTAssertEqual(expected, try sut(input))
    }

    func test_async_1_2_functionCompositionBackwardFirstSecondThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = try await aMulT(try aMulT(input))
        let sut = aMulT <<< aMulT
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_1_functionCompositionBackwardFirstSecondThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = try await mulT(try aMulT(input))
        let sut = mulT <<< aMulT
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_async_2_functionCompositionBackwardFirstSecondThrowable_argumentApplyResult() async throws {
        let input = getIntInput()
        let expected = try await aMulT(try mulT(input))
        let sut = aMulT <<< mulT
        let result = try await sut(input)
        XCTAssertEqual(expected, result)
    }

    func test_asyncFunctionComposition_success() {
        let input = getIntInput()
        let first = input |> getIdentityResult
        let sut = first ~~> getIdentityResult
        sut {
            switch $0 {
            case let .success(value):
                XCTAssertEqual(input, value)
            case .failure:
                XCTFail()
            }
        }
    }

    func test_asyncFunctionComposition_firstFunctionError() {
        let first = getIntInput() |> getErrorResult
        let sut = first ~~> getIdentityResult
        sut {
            switch $0 {
            case .success:
                XCTFail()
            case let .failure(error):
                XCTAssertEqual(TestError.general, error)
            }
        }
    }

    func test_asyncFunctionComposition_secondFunctionError() {
        let first = getIntInput() |> getIdentityResult
        let sut = first ~~> getErrorResult
        sut {
            switch $0 {
            case .success:
                XCTFail()
            case let .failure(error):
                XCTAssertEqual(TestError.general, error)
            }
        }
    }

    func test_effectfulFunctionComposition_sameResult() {
        func f(_ a: Int) -> Int? {
            a + a
        }
        func g(_ a: Int) -> String? {
            "\(a)"
        }

        let input = getIntInput()
        let expected = g(f(input)!)
        let sut = f >=> g
        XCTAssertEqual(expected, sut(input))
    }

    func test_effectfulFunctionComposition_nilResult() {
        func f(_ a: Int) -> Int? {
            nil
        }
        func g(_ a: Int) -> String? {
            "\(a)"
        }

        let input = getIntInput()
        let sut = f >=> g
        XCTAssertNil(sut(input))
    }
}
