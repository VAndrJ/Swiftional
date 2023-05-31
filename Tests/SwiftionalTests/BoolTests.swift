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

    func test_boolFoldEither() {
        let left = 1
        let right = "1"
        XCTAssertEqual(Either<Int, String>.left(left), false.foldEither({ left }, { right }))
        XCTAssertEqual(Either<Int, String>.right(right), true.foldEither({ left }, { right }))
    }
}
