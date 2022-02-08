//
//  ApplyableTests.swift
//  
//
//  Created by Volodymyr Andriienko on 08.02.2022.
//

import XCTest
@testable import Swiftional

class ApplyableTests: XCTestCase {

    func test_apply_closureApplied() {
        let input = 2
        let sut = MockObject()
        let result = sut.apply {
            $0.number = input
        }
        XCTAssertEqual(input, result.number)
    }

    func test_applyThrows_closureApplied() {
        let input = TestError.general
        let sut = MockObject()
        XCTAssertThrowsError(try sut.apply { _ in
            throw input
        }) { error in
            XCTAssertEqual(input, error as? TestError)
        }
    }

    func test_let_closureApplied() {
        let input = 2
        let sut = MockObject()
        let result = sut.let { _ in
            return input
        }
        XCTAssertEqual(input, result)
    }

    func test_letThrows_closureApplied() {
        let input = TestError.general
        let sut = MockObject()
        XCTAssertThrowsError(try sut.let { _ in
            throw input
        }) { error in
            XCTAssertEqual(input, error as? TestError)
        }
    }

    func test_applied_closureApplied() {
        let input = 2
        let sut = MockStruct()
        let result = sut.applied {
            $0.number = input
        }
        XCTAssertEqual(input, result.number)
    }

    func test_appliedThrows_closureApplied() {
        let input = TestError.general
        let sut = MockStruct()
        XCTAssertThrowsError(try sut.applied { _ in
            throw input
        }) { error in
            XCTAssertEqual(input, error as? TestError)
        }
    }
}

private class MockObject: Applyable {
    var number: Int?
}

private struct MockStruct: Applyable {
    var number: Int?
}
