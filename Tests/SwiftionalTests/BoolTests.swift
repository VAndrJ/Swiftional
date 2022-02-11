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
}
