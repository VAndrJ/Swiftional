//
//  EitherTests.swift
//  
//
//  Created by Volodymyr Andriienko on 09.02.2022.
//

import XCTest
@testable import Swiftional

class EitherTests: XCTestCase {

    func test_eitherLeft_foldIdentityEquals() {
        let expected = "test"
        let either = Either<String, Void>.left(expected)
        XCTAssertEqual(expected, either.fold(identity, constant("fail")))
    }

    func test_async_1_2_eitherLeft_foldIdentityEquals() async {
        let expected = "test"
        let either = Either<String, Void>.left(expected)
        await aXCTAssertEqual(expected, await either.fold(aId, aConst("fail")))
    }

    func test_async_1_eitherLeft_foldIdentityEquals() async {
        let expected = "test"
        let either = Either<String, Void>.left(expected)
        await aXCTAssertEqual(expected, await either.fold(aId, const("fail")))
    }

    func test_async_2_eitherLeft_foldIdentityEquals() async {
        let expected = "test"
        let either = Either<String, Void>.left(expected)
        await aXCTAssertEqual(expected, await either.fold(id, aConst("fail")))
    }

    func test_eitherLeft_valueEquals() {
        let expected = "test"
        let either = Either<String, Never>.left(expected)
        XCTAssertEqual(expected, either.leftValue)
    }

    func test_eitherLeft_isLeft() {
        let expected = "test"
        let either = Either<String, Never>.left(expected)
        XCTAssertTrue(either.isLeft)
    }

    func test_eitherRight_foldIdentityEquals() {
        let expected = "test"
        let either = Either<Void, String>.right(expected)
        XCTAssertEqual(expected, either.fold(constant("fail"), identity))
    }

    func test_async_eitherRight_foldIdentityEquals() async {
        let expected = "test"
        let either = Either<Void, String>.right(expected)
        await aXCTAssertEqual(expected, await either.fold(aConst("fail"), aId))
    }

    func test_eitherRight_valueEquals() {
        let expected = "test"
        let either = Either<Never, String>.right(expected)
        XCTAssertEqual(expected, either.rightValue)
    }

    func test_eitherRight_isRight() {
        let expected = "test"
        let either = Either<Never, String>.right(expected)
        XCTAssertTrue(either.isRight)

    }

    func test_eitherBimap_left() {
        let value = 1
        let either = Either<Int, Int>.left(value)
        let expected = getString(value)
        XCTAssertEqual(expected, either.bimap(getString, getString).leftValue)
    }

    func test_eitherBimap_right() {
        let value = 1
        let either = Either<Int, Int>.right(value)
        let expected = getString(value)
        XCTAssertEqual(expected, either.bimap(getString, getString).rightValue)
    }

    func test_eitherMap_left() {
        let value = 1
        let either = Either<Int, Int>.left(value)
        let expected = getString(value)
        XCTAssertEqual(expected, either.mapLeft(getString).leftValue)
    }

    func test_eitherMap_right() {
        let value = 1
        let either = Either<Int, Int>.right(value)
        let expected = getString(value)
        XCTAssertEqual(expected, either.map(getString).rightValue)
    }

    func test_eitherFlatMap_right() {
        let value = 1
        let either = Either<Int, Int>.right(value)
        let expected = Either<Int, String>.right(getString(value))
        XCTAssertEqual(expected, either.flatMap { Either<Int, String>.right(getString($0)) })
    }

    func test_eitherFlatMap_left() {
        let value = 1
        let either = Either<Int, Int>.left(value)
        let expected = Either<Int, String>.left(value)
        XCTAssertEqual(expected, either.flatMap { Either<Int, String>.right(getString($0)) })
    }

    func test_eitherSwap_rightToLeft() {
        let value = 1
        let either = Either<String, Int>.right(value)
        let expected = either.rightValue
        XCTAssertEqual(expected, either.swapped().leftValue)
    }

    func test_eitherSwap_leftToRight() {
        let value = 1
        let either = Either<Int, String>.left(value)
        let expected = either.leftValue
        XCTAssertEqual(expected, either.swapped().rightValue)
    }

    func test_eitherFoldLeft_expectedConstResultEquals() {
        let value = 1
        let expected = getString(value)
        XCTAssertEqual(expected, Either<Int, String>.left(value).foldLeft(getString, expected))
        XCTAssertEqual(expected, Either<Int, String>.right("").foldLeft(getString, expected))
    }

    func test_async_eitherFoldLeft_expectedConstResultEquals() async {
        let value = 1
        let expected = getString(value)
        await aXCTAssertEqual(expected, await Either<Int, String>.left(value).foldLeft(aGetString, expected))
        await aXCTAssertEqual(expected, await Either<Int, String>.right("").foldLeft(aGetString, expected))
    }

    func test_eitherFoldRight_expectedConstResultEquals() {
        let value = 1
        let expected = getString(value)
        XCTAssertEqual(expected, Either<String, Int>.right(value).foldRight(expected, getString))
        XCTAssertEqual(expected, Either<String, Int>.left("").foldRight(expected, getString))
    }

    func test_async_eitherFoldRight_expectedConstResultEquals() async {
        let value = 1
        let expected = getString(value)
        await aXCTAssertEqual(expected, await Either<String, Int>.right(value).foldRight(expected, aGetString))
        await aXCTAssertEqual(expected, await Either<String, Int>.left("").foldRight(expected, aGetString))
    }

    func test_eitherFoldRun() {
        let expected = 1
        Either<Int, Int>.left(expected).foldRun(
            { XCTAssertEqual(expected, $0) },
            { _ in XCTFail() }
        )
        Either<Int, Int>.right(expected).foldRun(
            { _ in XCTFail() },
            { XCTAssertEqual(expected, $0) }
        )
    }

    func test_async_eitherFoldRun() async {
        let expected = 1
        await Either<Int, Int>.left(expected).foldRun(
            { await aXCTAssertEqual(expected, $0) },
            { _ in await aXCTFail() }
        )
        await Either<Int, Int>.right(expected).foldRun(
            { _ in await aXCTFail() },
            { await aXCTAssertEqual(expected, $0) }
        )
    }

    func test_eitherMerge() {
        let expected = 1
        XCTAssertEqual(expected, Either<Int, Int>.left(expected).mergedValue)
        XCTAssertEqual(expected, Either<Int, Int>.right(expected).mergedValue)
    }

    func test_eitherContains() {
        let expected = 1
        XCTAssertTrue(Either<Int, Int>.right(expected).contains(expected))
    }

    func test_eitherDescription() {
        let expected = 1
        XCTAssertEqual("Right(\(expected))", Either<Int, Int>.right(expected).description)
        XCTAssertEqual("Left(\(expected))", Either<Int, Int>.left(expected).description)
    }

    func test_eitherDebugDescription() {
        let expected = "1"
        XCTAssertEqual("Right(\(expected.debugDescription))", Either<String, String>.right(expected).debugDescription)
        XCTAssertEqual("Left(\(expected.debugDescription))", Either<String, String>.left(expected).debugDescription)
    }
}
