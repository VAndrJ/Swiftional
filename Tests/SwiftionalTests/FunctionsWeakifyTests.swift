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

    func test_weakifyOperator_called() {
        let fun: () -> Void = object ?> { $0.executeBlock(result: true) }
        fun()
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperator_notCalledOnObjectNil() {
        let fun: () -> Void = object ?> { $0.executeBlock(result: true) }
        object = nil
        fun()
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOperatorResult_called() {
        let fun: () -> Bool? = object ?> {
            $0.executeBlock(result: true)
            return true
        }
        XCTAssertEqual(true, fun())
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorResult_notCalledOnObjectNil() {
        let fun: () -> Bool? = object ?> {
            $0.executeBlock(result: true)
            return true
        }
        object = nil
        XCTAssertNil(fun())
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOperatorParameter_called() {
        let fun: (String) -> Void = object ?> { $0.executeBlock(result: $1 == "Test") }
        fun("Test")
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorParameter_notCalledOnObjectNil() {
        let fun: (String) -> Void = object ?> { $0.executeBlock(result: $1 == "Test") }
        object = nil
        fun("Test")
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOperatorParameterResult_called() {
        let fun: (String) -> Bool? = object ?> {
            $0.executeBlock(result: $1 == "Test")
            return true
        }
        XCTAssertEqual(true, fun("Test"))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorParameterResult_notCalledOnObjectNil() {
        let fun: (String) -> Bool? = object ?> {
            $0.executeBlock(result: $1 == "Test")
            return true
        }
        object = nil
        XCTAssertNil(fun("Test"))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOperatorIgnoredParameter_called() {
        let fun: (String) -> Void = object ?> { $0.executeBlock(result: true) }
        fun("Test")
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorIgnoredParameter_notCalledOnObjectNil() {
        let fun: (String) -> Void = object ?> { $0.executeBlock(result: true) }
        object = nil
        fun("Test")
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOperatorIgnoredParameterResult_called() {
        let fun: (String) -> Bool? = object ?> {
            $0.executeBlock(result: true)
            return true
        }
        XCTAssertEqual(true, fun("Test"))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorIgnoredParameterResult_notCalledOnObjectNil() {
        let fun: (String) -> Bool? = object ?> {
            $0.executeBlock(result: true)
            return true
        }
        object = nil
        XCTAssertNil(fun("Test"))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOperatorTwoParameter_called() {
        let fun: (String, String) -> Void = object ?> { $0.executeBlock(result: $1 == "Test" && $2 == "Test1") }
        fun("Test", "Test1")
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorTwoParameter_notCalledOnObjectNil() {
        let fun: (String, String) -> Void = object ?> { $0.executeBlock(result: $1 == "Test" && $2 == "Test1") }
        object = nil
        fun("Test", "Test1")
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOperatorTwoParameterResult_called() {
        let fun: (String, String) -> Bool? = object ?> {
            $0.executeBlock(result: $1 == "Test" && $2 == "Test1")
            return true
        }
        XCTAssertEqual(true, fun("Test", "Test1"))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorTwoParameterResult_notCalledOnObjectNil() {
        let fun: (String, String) -> Bool? = object ?> {
            $0.executeBlock(result: $1 == "Test" && $2 == "Test1")
            return true
        }
        object = nil
        XCTAssertNil(fun("Test", "Test1"))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOperatorTwoParameterIgnoreResult_called() {
        let fun: (String, String) -> Bool? = object ?> {
            $0.executeBlock(result: true)
            return true
        }
        XCTAssertEqual(true, fun("Test", "Test1"))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorTwoParameterIgnoreResult_notCalledOnObjectNil() {
        let fun: (String, String) -> Bool? = object ?> {
            $0.executeBlock(result: true)
            return true
        }
        object = nil
        XCTAssertNil(fun("Test", "Test1"))
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
