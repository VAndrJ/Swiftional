//
//  FunctionsWeakifyTests.swift
//  
//
//  Created by VAndrJ on 01.05.2023.
//

import XCTest
@testable import Swiftional

class FunctionsWeakifyTests: XCTestCase {
    private var object: MockObject!
    private var isFunctionCalled = false

    override func setUp() {
        object = MockObject(block: {
            self.isFunctionCalled = $0
        })
    }

    override func tearDown() {
        object = nil
        isFunctionCalled = false
    }

    func test_weakifyFunction_called() {
        let fun = weakify(object) { $0.executeBlock(result: true) }
        fun()
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyFunction_notCalledOnObjectNil() {
        let fun = weakify(object) { $0.executeBlock(result: true) }
        object = nil
        fun()
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOperator_called() {
        let fun = object ?> { $0.executeBlock(result: true) }
        fun()
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperator_notCalledOnObjectNil() {
        let fun = object ?> { $0.executeBlock(result: true) }
        object = nil
        fun()
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyFunctionParameter_called() {
        let fun: (String) -> Void  = weakify(object) { $0.executeBlock(result: $1 == "Test") }
        fun("Test")
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyFunctionParameter_notCalledOnObjectNil() {
        let fun: (String) -> Void = weakify(object) { $0.executeBlock(result: $1 == "Test") }
        object = nil
        fun("Test")
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOperatorParameter_called() {
        let fun: (String) -> Void  = object ?> { $0.executeBlock(result: $1 == "Test") }
        fun("Test")
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorParameter_notCalledOnObjectNil() {
        let fun: (String) -> Void  = object ?> { $0.executeBlock(result: $1 == "Test") }
        object = nil
        fun("Test")
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyFunctionIgnoredParameter_called() {
        let fun: (String) -> Void  = weakify(object) { $0.executeBlock(result: true) }
        fun("Test")
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyFunctionIgnoredParameter_notCalledOnObjectNil() {
        let fun: (String) -> Void = weakify(object) { $0.executeBlock(result: true) }
        object = nil
        fun("Test")
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOperatorIgnoredParameter_called() {
        let fun: (String) -> Void  = object ?> { $0.executeBlock(result: true) }
        fun("Test")
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorIgnoredParameter_notCalledOnObjectNil() {
        let fun: (String) -> Void  = object ?> { $0.executeBlock(result: true) }
        object = nil
        fun("Test")
        XCTAssertFalse(isFunctionCalled)
    }
}

private class MockObject {
    private let block: (Bool) -> Void

    init(block: @escaping (Bool) -> Void) {
        self.block = block
    }

    func executeBlock(result: Bool) {
        block(result)
    }
}
