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
        XCTAssertEqual(input, value.fold(constant(input), constant("fail")))
    }

    func test_boolTrue_foldEquals() {
        let input = "test"
        let value = true
        XCTAssertEqual(input, value.fold(constant("fail"), constant(input)))
    }

    func test_boolFoldRun() {
        false.foldRun({}, { XCTFail() })
        true.foldRun({ XCTFail() }, {})
    }

    func test_boolSemigroupCombine() {
        XCTAssertTrue(true.combine(false))
        XCTAssertTrue(true.combine(true))
        XCTAssertTrue(false.combine(true))
        XCTAssertFalse(false.combine(false))
    }

    func test_boolSemigroupCombine_extensionCombineFunction() {
        XCTAssertTrue(Bool.combine(true, true))
        XCTAssertTrue(Bool.combine(true, false))
        XCTAssertTrue(Bool.combine(false, true))
        XCTAssertFalse(Bool.combine(false, false))
    }

    func test_boolSemigroupCombine_extensionCombineAllArrayFunction() {
        XCTAssertTrue(Bool.combineAll(true, [true]))
        XCTAssertTrue(Bool.combineAll(true, [false]))
        XCTAssertTrue(Bool.combineAll(false, [true]))
        XCTAssertFalse(Bool.combineAll(false, [false]))
    }

    func test_boolSemigroupCombine_extensionCombineAllVariadicFunction() {
        XCTAssertTrue(Bool.combineAll(true, true))
        XCTAssertTrue(Bool.combineAll(true, false))
        XCTAssertTrue(Bool.combineAll(false, true))
        XCTAssertFalse(Bool.combineAll(false, false))
    }

    func test_boolSemigroupCombine_extensionAllArrayFunction() {
        XCTAssertTrue(true.combineAll([true]))
        XCTAssertTrue(true.combineAll([false]))
        XCTAssertTrue(false.combineAll([true]))
        XCTAssertFalse(false.combineAll([false]))
    }

    func test_boolSemigroupCombine_extensionAllVariadicFunction() {
        XCTAssertTrue(true.combineAll(true))
        XCTAssertTrue(true.combineAll(false))
        XCTAssertTrue(false.combineAll(true))
        XCTAssertFalse(false.combineAll(false))
    }

    func test_boolMonoidEmpty() {
        XCTAssertFalse(Bool.empty)
    }
    
    func test_boolMonoidCombine_associativeOriginal() {
        XCTAssertTrue(true.combine(Bool.empty))
        XCTAssertFalse(false.combineAll(Bool.empty))
        XCTAssertTrue(Bool.empty.combine(true))
        XCTAssertFalse(Bool.empty.combineAll(false))
    }

    func test_boolFoldEither() {
        let left = 1
        let right = "1"
        XCTAssertEqual(Either<Int, String>.left(left), false.foldEither({ left }, { right }))
        XCTAssertEqual(Either<Int, String>.right(right), true.foldEither({ left }, { right }))
    }
}
