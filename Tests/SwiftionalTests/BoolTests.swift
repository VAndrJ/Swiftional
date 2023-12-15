//
//  BoolTests.swift
//  
//
//  Created by Volodymyr Andriienko on 10.02.2022.
//

import XCTest
@testable import Swiftional

class BoolTests: XCTestCase {

    func test_boolFalse_foldEquals() {
        let input = "test"
        let value = false
        let result = value.fold(constant(input), constant("fail"))
        XCTAssertEqual(input, result)
    }

    func test_async_1_2_boolFalse_foldEquals() async {
        let input = "test"
        let value = false
        let result = await value.fold(aConst(input), aConst("fail"))
        XCTAssertEqual(input, result)
    }

    func test_async_1_boolFalse_foldEquals() async {
        let input = "test"
        let value = false
        let result = await value.fold(aConst(input), const("fail"))
        XCTAssertEqual(input, result)
    }

    func test_async_2_boolFalse_foldEquals() async {
        let input = "test"
        let value = false
        let result = await value.fold(const(input), aConst("fail"))
        XCTAssertEqual(input, result)
    }

    func test_boolTrue_foldEquals() {
        let input = "test"
        let value = true
        let result = value.fold(constant("fail"), constant(input))
        XCTAssertEqual(input, result)
    }

    func test_async_1_2_boolTrue_foldEquals() async {
        let input = "test"
        let value = true
        let result = await value.fold(aConst("fail"), aConst(input))
        XCTAssertEqual(input, result)
    }

    func test_async_1_boolTrue_foldEquals() async {
        let input = "test"
        let value = true
        let result = await value.fold(aConst("fail"), const(input))
        XCTAssertEqual(input, result)
    }

    func test_async_2_boolTrue_foldEquals() async {
        let input = "test"
        let value = true
        let result = await value.fold(const("fail"), aConst(input))
        XCTAssertEqual(input, result)
    }

    func test_boolFoldRun() {
        false.foldRun({ XCTSuccess() }, { XCTFail() })
        true.foldRun({ XCTFail() }, { XCTSuccess() })
    }

    func test_async_1_2_boolFoldRun() async {
        await false.foldRun({ await aXCTSuccess() }, { await aXCTFail() })
        await true.foldRun({ await aXCTFail() }, { await aXCTSuccess() })
    }

    func test_async_1_boolFoldRun() async {
        await false.foldRun({ XCTSuccess() }, { await aXCTFail() })
        await true.foldRun({ await aXCTFail() }, { XCTSuccess() })
    }

    func test_async_2_boolFoldRun() async {
        await false.foldRun({ await aXCTSuccess() }, { XCTFail() })
        await true.foldRun({ XCTFail() }, { await aXCTSuccess() })
    }

    func test_boolFoldEither() {
        let left = 1
        let right = "1"
        let resultFalse = false.foldEither({ left }, { right })
        let resultTrue = true.foldEither({ left }, { right })
        XCTAssertEqual(Either<Int, String>.left(left), resultFalse)
        XCTAssertEqual(Either<Int, String>.right(right), resultTrue)
    }

    func test_async_1_2_boolFoldEither() async {
        let left = 1
        let right = "1"
        let resultFalse = await false.foldEither(aConst(left), aConst(right))
        let resultTrue = await true.foldEither(aConst(left), aConst(right))
        XCTAssertEqual(Either<Int, String>.left(left), resultFalse)
        XCTAssertEqual(Either<Int, String>.right(right), resultTrue)
    }

    func test_async_1_boolFoldEither() async {
        let left = 1
        let right = "1"
        let resultFalse = await false.foldEither(aConst(left), const(right))
        let resultTrue = await true.foldEither(aConst(left), const(right))
        XCTAssertEqual(Either<Int, String>.left(left), resultFalse)
        XCTAssertEqual(Either<Int, String>.right(right), resultTrue)
    }

    func test_async_2_boolFoldEither() async {
        let left = 1
        let right = "1"
        let resultFalse = await false.foldEither(const(left), aConst(right))
        let resultTrue = await true.foldEither(const(left), aConst(right))
        XCTAssertEqual(Either<Int, String>.left(left), resultFalse)
        XCTAssertEqual(Either<Int, String>.right(right), resultTrue)
    }
}
