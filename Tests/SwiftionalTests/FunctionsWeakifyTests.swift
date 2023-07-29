//
//  FunctionsWeakifyTests.swift
//  
//
//  Created by Volodymyr Andriienko on 01.05.2023.
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

    func test_weakify_called() {
        let fun: () -> Void = object ?>> { $0.execute }
        fun()
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakify_notCalledOnObjectNil() {
        let fun: () -> Void = object ?>> { $0.execute }
        object = nil
        fun()
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOptional_called() {
        let fun: () -> Void = object ?>> { $0.executeClosure }
        fun()
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptional_notCalledOnObjectNil() {
        let fun: () -> Void = object ?>> { $0.executeClosure }
        object = nil
        fun()
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOneParameter_called() {
        let fun: (Bool) -> Void = object ?>> { $0.executeBlock(result:) }
        fun(true)
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOneParameter_notCalledOnObjectNil() {
        let fun: (Bool) -> Void = object ?>> { $0.executeBlock(result:) }
        object = nil
        fun(true)
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyTwoParameters_called() {
        let fun: (Bool, Bool) -> Void = object ?>> { $0.executeBlock(result:second:) }
        fun(true, true)
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyTwoParameters_notCalledOnObjectNil() {
        let fun: (Bool, Bool) -> Void = object ?>> { $0.executeBlock(result:second:) }
        object = nil
        fun(true, true)
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyTwoParametersIgnored_called() {
        let fun: (Bool, Bool) -> Void = object ?>> { $0.execute }
        fun(true, true)
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyTwoParametersIgnored_notCalledOnObjectNil() {
        let fun: (Bool, Bool) -> Void = object ?>> { $0.execute }
        object = nil
        fun(true, true)
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOptionalTwoParametersIgnored_called() {
        let fun: (Bool, Bool) -> Void = object ?>> { $0.executeClosure }
        fun(true, true)
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyTwoParametersOptionalIgnored_notCalledOnObjectNil() {
        let fun: (Bool, Bool) -> Void = object ?>> { $0.executeClosure }
        object = nil
        fun(true, true)
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOneParameterIgnored_called() {
        let fun: (Bool) -> Void = object ?>> { $0.execute }
        fun(true)
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOneParameterIgnored_notCalledOnObjectNil() {
        let fun: (Bool) -> Void = object ?>> { $0.execute }
        object = nil
        fun(true)
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOptionalOneParameterIgnored_called() {
        let fun: (Bool) -> Void = object ?>> { $0.executeClosure }
        fun(true)
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalOneParameterIgnored_notCalledOnObjectNil() {
        let fun: (Bool) -> Void = object ?>> { $0.executeClosure }
        object = nil
        fun(true)
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOptionalOneParameter_called() {
        let fun: (Bool) -> Void = object ?>> { $0.executeClosureWithParameter }
        fun(true)
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalOneParameter_notCalledOnObjectNil() {
        let fun: (Bool) -> Void = object ?>> { $0.executeClosureWithParameter }
        object = nil
        fun(true)
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyResult_called() {
        let fun: () -> Bool? = object ?>> { $0.executeAndReturn }
        XCTAssertEqual(true, fun())
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyResult_notCalledOnObjectNil() {
        let fun: () -> Bool? = object ?>> { $0.executeAndReturn }
        object = nil
        XCTAssertNil(fun())
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOptionalResult_called() {
        let fun: () -> Bool? = object ?>> { $0.executeClosureAndReturn }
        XCTAssertEqual(true, fun())
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalResult_notCalledOnObjectNil() {
        let fun: () -> Bool? = object ?>> { $0.executeClosureAndReturn }
        object = nil
        XCTAssertNil(fun())
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyParameterResult_called() {
        let fun: (Bool) -> Bool? = object ?>> { $0.executeBlockAndReturn(result:) }
        XCTAssertEqual(true, fun(true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyParameterResult_notCalledOnObjectNil() {
        let fun: (Bool) -> Bool? = object ?>> { $0.executeBlockAndReturn(result:) }
        object = nil
        XCTAssertNil(fun(true))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOptionalParameterResult_called() {
        let fun: (Bool) -> Bool? = object ?>> { $0.executeClosureWithParameterAndReturn }
        XCTAssertEqual(true, fun(true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalParameterResult_notCalledOnObjectNil() {
        let fun: (Bool) -> Bool? = object ?>> { $0.executeClosureWithParameterAndReturn }
        object = nil
        XCTAssertNil(fun(true))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyTwoParametersResult_called() {
        let fun: (Bool, Bool) -> Bool? = object ?>> { $0.executeBlockAndReturn(result:second:) }
        XCTAssertEqual(true, fun(true, true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyTwoParametersResult_notCalledOnObjectNil() {
        let fun: (Bool, Bool) -> Bool? = object ?>> { $0.executeBlockAndReturn(result:second:) }
        object = nil
        XCTAssertNil(fun(true, true))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOptionalTwoParametersResult_called() {
        let fun: (Bool, Bool) -> Bool? = object ?>> { $0.executeClosureWithTwoParametersAndReturn }
        XCTAssertEqual(true, fun(true, true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalTwoParametersResult_notCalledOnObjectNil() {
        let fun: (Bool, Bool) -> Bool? = object ?>> { $0.executeClosureWithTwoParametersAndReturn }
        object = nil
        XCTAssertNil(fun(true, true))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyTwoParametersIgnoredResult_called() {
        let fun: (Bool, Bool) -> Bool? = object ?>> { $0.executeAndReturn }
        XCTAssertEqual(true, fun(true, true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyTwoParametersIgnoredResult_notCalledOnObjectNil() {
        let fun: (Bool, Bool) -> Bool? = object ?>> { $0.executeAndReturn }
        object = nil
        XCTAssertNil(fun(true, true))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOptionalTwoParametersIgnoredResult_called() {
        let fun: (Bool, Bool) -> Bool? = object ?>> { $0.executeClosureAndReturn }
        XCTAssertEqual(true, fun(true, true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalTwoParametersIgnoredResult_notCalledOnObjectNil() {
        let fun: (Bool, Bool) -> Bool? = object ?>> { $0.executeClosureAndReturn }
        object = nil
        XCTAssertNil(fun(true, true))
        XCTAssertFalse(isFunctionCalled)
    }
}

private class MockObject {
    private let block: (Bool) -> Void
    private(set) lazy var executeClosure: (() -> Void)? = { [weak self] in
        self?.block(true)
    }
    private(set) lazy var executeClosureAndReturn: (() -> Bool)? = { [weak self] in
        self?.block(true)
        return true
    }
    private(set) lazy var executeClosureWithParameter: ((Bool) -> Void)? = { [weak self] in
        self?.block($0)
    }
    private(set) lazy var executeClosureWithParameterAndReturn: ((Bool) -> Bool)? = { [weak self] in
        self?.block($0)
        return $0
    }
    private(set) lazy var executeClosureWithTwoParameters: ((Bool, Bool) -> Void)? = { [weak self]in
        self?.block($0 && $1)
    }
    private(set) lazy var executeClosureWithTwoParametersAndReturn: ((Bool, Bool) -> Bool)? = { [weak self] in
        self?.block($0 && $1)
        return $0 && $1
    }

    init(block: @escaping (Bool) -> Void) {
        self.block = block
    }

    func executeBlock(result: Bool) {
        block(result)
    }

    func executeBlockAndReturn(result: Bool) -> Bool {
        block(result)
        return result
    }

    func executeBlock(result: Bool, second: Bool) {
        block(result && second)
    }

    func executeBlockAndReturn(result: Bool, second: Bool) -> Bool {
        block(result && second)
        return result && second
    }

    func execute() {
        block(true)
    }

    func executeAndReturn() -> Bool {
        block(true)
        return true
    }
}
