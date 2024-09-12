//
//  FunctionsWeakifyTests.swift
//  
//
//  Created by Volodymyr Andriienko on 01.05.2023.
//

import XCTest
@testable import Swiftional

class FunctionsWeakifyTests: XCTestCase, @unchecked Sendable {
    private var object: MockObject!
    private var sendableObject: SendableMockObject!
    private var isFunctionCalled = false

    override func setUp() {
        object = MockObject(block: self ?> { $0.isFunctionCalled = $1 })
        sendableObject = SendableMockObject(block: self ?> { $0.isFunctionCalled = $1 })
    }

    override func tearDown() {
        sendableObject = nil
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

    func test_weakifyOperatorSendable_called() {
        let fun: @Sendable () -> Void = sendableObject ?> { $0.executeBlock(result: true) }
        fun()
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorSendable_notCalledOnObjectNil() {
        let fun: @Sendable () -> Void = sendableObject ?> { $0.executeBlock(result: true) }
        sendableObject = nil
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

    func test_weakifyOperatorResultSendable_called() {
        let fun: @Sendable () -> Bool? = sendableObject ?> {
            $0.executeBlock(result: true)

            return true
        }
        XCTAssertEqual(true, fun())
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorResultSendalbe_notCalledOnObjectNil() {
        let fun: @Sendable () -> Bool? = sendableObject ?> {
            $0.executeBlock(result: true)

            return true
        }
        sendableObject = nil
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

    func test_weakifyOperatorParameterSendable_called() {
        let fun: @Sendable (String) -> Void = sendableObject ?> { $0.executeBlock(result: $1 == "Test") }
        fun("Test")
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorParameterSendable_notCalledOnObjectNil() {
        let fun: @Sendable (String) -> Void = sendableObject ?> { $0.executeBlock(result: $1 == "Test") }
        sendableObject = nil
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

    func test_weakifyOperatorParameterResultSendable_called() {
        let fun: @Sendable (String) -> Bool? = sendableObject ?> {
            $0.executeBlock(result: $1 == "Test")
            return true
        }
        XCTAssertEqual(true, fun("Test"))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorParameterResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable (String) -> Bool? = sendableObject ?> {
            $0.executeBlock(result: $1 == "Test")
            return true
        }
        sendableObject = nil
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

    func test_weakifyOperatorIgnoredParameterSendable_called() {
        let fun: @Sendable (String) -> Void = sendableObject ?> { $0.executeBlock(result: true) }
        fun("Test")
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorIgnoredParameterSendable_notCalledOnObjectNil() {
        let fun: @Sendable (String) -> Void = sendableObject ?> { $0.executeBlock(result: true) }
        sendableObject = nil
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

    func test_weakifyOperatorIgnoredParameterResultSendable_called() {
        let fun: @Sendable (String) -> Bool? = sendableObject ?> {
            $0.executeBlock(result: true)
            return true
        }
        XCTAssertEqual(true, fun("Test"))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorIgnoredParameterResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable (String) -> Bool? = sendableObject ?> {
            $0.executeBlock(result: true)
            return true
        }
        sendableObject = nil
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

    func test_weakifyOperatorTwoParameterSendable_called() {
        let fun: @Sendable (String, String) -> Void = sendableObject ?> { $0.executeBlock(result: $1 == "Test" && $2 == "Test1") }
        fun("Test", "Test1")
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorTwoParameterSendable_notCalledOnObjectNil() {
        let fun: @Sendable (String, String) -> Void = sendableObject ?> { $0.executeBlock(result: $1 == "Test" && $2 == "Test1") }
        sendableObject = nil
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

    func test_weakifyOperatorTwoParameterResultSendable_called() {
        let fun: @Sendable (String, String) -> Bool? = sendableObject ?> {
            $0.executeBlock(result: $1 == "Test" && $2 == "Test1")
            return true
        }
        XCTAssertEqual(true, fun("Test", "Test1"))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorTwoParameterResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable (String, String) -> Bool? = sendableObject ?> {
            $0.executeBlock(result: $1 == "Test" && $2 == "Test1")
            return true
        }
        sendableObject = nil
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

    func test_weakifyOperatorTwoParameterIgnoreResultSendable_called() {
        let fun: @Sendable (String, String) -> Bool? = sendableObject ?> {
            $0.executeBlock(result: true)
            return true
        }
        XCTAssertEqual(true, fun("Test", "Test1"))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOperatorTwoParameterIgnoreResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable (String, String) -> Bool? = sendableObject ?> {
            $0.executeBlock(result: true)
            return true
        }
        sendableObject = nil
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

    func test_weakifySendable_called() {
        let fun: @Sendable () -> Void = sendableObject ?>> { $0.execute }
        fun()
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifySendable_notCalledOnObjectNil() {
        let fun: @Sendable () -> Void = sendableObject ?>> { $0.execute }
        sendableObject = nil
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

    func test_weakifyOptionalSendable_called() {
        let fun: @Sendable () -> Void = sendableObject ?>> { $0.executeClosure }
        fun()
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalSendable_notCalledOnObjectNil() {
        let fun: @Sendable () -> Void = sendableObject ?>> { $0.executeClosure }
        sendableObject = nil
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

    func test_weakifyOneParameterSendable_called() {
        let fun: @Sendable (Bool) -> Void = sendableObject ?>> { $0.executeBlock(result:) }
        fun(true)
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOneParameterSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool) -> Void = sendableObject ?>> { $0.executeBlock(result:) }
        sendableObject = nil
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

    func test_weakifyTwoParametersSendable_called() {
        let fun: @Sendable (Bool, Bool) -> Void = sendableObject ?>> { $0.executeBlock(result:second:) }
        fun(true, true)
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyTwoParametersSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool, Bool) -> Void = sendableObject ?>> { $0.executeBlock(result:second:) }
        sendableObject = nil
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

    func test_weakifyTwoParametersIgnoredSendable_called() {
        let fun: @Sendable (Bool, Bool) -> Void = sendableObject ?>> { $0.execute }
        fun(true, true)
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyTwoParametersIgnoredSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool, Bool) -> Void = sendableObject ?>> { $0.execute }
        sendableObject = nil
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

    func test_weakifyOptionalTwoParametersIgnoredSendable_called() {
        let fun: @Sendable (Bool, Bool) -> Void = sendableObject ?>> { $0.executeClosure }
        fun(true, true)
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyTwoParametersOptionalIgnoredSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool, Bool) -> Void = sendableObject ?>> { $0.executeClosure }
        sendableObject = nil
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

    func test_weakifyOneParameterIgnoredSendable_called() {
        let fun: @Sendable (Bool) -> Void = sendableObject ?>> { $0.execute }
        fun(true)
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOneParameterIgnoredSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool) -> Void = sendableObject ?>> { $0.execute }
        sendableObject = nil
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

    func test_weakifyOptionalOneParameterIgnoredSendable_called() {
        let fun: @Sendable (Bool) -> Void = sendableObject ?>> { $0.executeClosure }
        fun(true)
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalOneParameterIgnoredSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool) -> Void = sendableObject ?>> { $0.executeClosure }
        sendableObject = nil
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

    func test_weakifyOptionalOneParameterSendable_called() {
        let fun: @Sendable (Bool) -> Void = sendableObject ?>> { $0.executeClosureWithParameter }
        fun(true)
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalOneParameterSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool) -> Void = sendableObject ?>> { $0.executeClosureWithParameter }
        sendableObject = nil
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

    func test_weakifyResultSendable_called() {
        let fun: @Sendable () -> Bool? = sendableObject ?>> { $0.executeAndReturn }
        XCTAssertEqual(true, fun())
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable () -> Bool? = sendableObject ?>> { $0.executeAndReturn }
        sendableObject = nil
        XCTAssertNil(fun())
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyFunctionOptionalResult_called() {
        let fun: () -> Bool? = object ?>> { $0.executeAndReturnOptional }
        XCTAssertEqual(true, fun())
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyFunctionOptionalResult_notCalledOnObjectNil() {
        let fun: () -> Bool? = object ?>> { $0.executeAndReturnOptional }
        object = nil
        XCTAssertNil(fun())
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyFunctionOptionalResultSendable_called() {
        let fun: @Sendable () -> Bool? = sendableObject ?>> { $0.executeAndReturnOptional }
        XCTAssertEqual(true, fun())
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyFunctionOptionalResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable () -> Bool? = sendableObject ?>> { $0.executeAndReturnOptional }
        sendableObject = nil
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

    func test_weakifyOptionalOptionalResult_called() {
        let fun: () -> Bool? = object ?>> { $0.executeClosureAndReturnOptional }
        XCTAssertEqual(true, fun())
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalOptionalResult_notCalledOnObjectNil() {
        let fun: () -> Bool? = object ?>> { $0.executeClosureAndReturnOptional }
        object = nil
        XCTAssertNil(fun())
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOptionalResultSendable_called() {
        let fun: @Sendable () -> Bool? = sendableObject ?>> { $0.executeClosureAndReturn }
        XCTAssertEqual(true, fun())
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalOptionalResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable () -> Bool? = sendableObject ?>> { $0.executeClosureAndReturnOptional }
        sendableObject = nil
        XCTAssertNil(fun())
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOptionalOptionalResultSendable_called() {
        let fun: @Sendable () -> Bool? = sendableObject ?>> { $0.executeClosureAndReturnOptional }
        XCTAssertEqual(true, fun())
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable () -> Bool? = sendableObject ?>> { $0.executeClosureAndReturn }
        sendableObject = nil
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

    func test_weakifyParameterResultSendable_called() {
        let fun: @Sendable (Bool) -> Bool? = sendableObject ?>> { $0.executeBlockAndReturn(result:) }
        XCTAssertEqual(true, fun(true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyParameterResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool) -> Bool? = sendableObject ?>> { $0.executeBlockAndReturn(result:) }
        sendableObject = nil
        XCTAssertNil(fun(true))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyParameterOptionalResult_called() {
        let fun: (Bool) -> Bool? = object ?>> { $0.executeBlockAndReturnOptional(result:) }
        XCTAssertEqual(true, fun(true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyParameterOptionalResult_notCalledOnObjectNil() {
        let fun: (Bool) -> Bool? = object ?>> { $0.executeBlockAndReturnOptional(result:) }
        object = nil
        XCTAssertNil(fun(true))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyParameterOptionalResultSendable_called() {
        let fun: @Sendable (Bool) -> Bool? = sendableObject ?>> { $0.executeBlockAndReturnOptional(result:) }
        XCTAssertEqual(true, fun(true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyParameterOptionalResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool) -> Bool? = sendableObject ?>> { $0.executeBlockAndReturnOptional(result:) }
        sendableObject = nil
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

    func test_weakifyOptionalParameterOptionalResult_called() {
        let fun: (Bool) -> Bool? = object ?>> { $0.executeClosureWithParameterAndReturnOptional }
        XCTAssertEqual(true, fun(true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalParameterOptionalResult_notCalledOnObjectNil() {
        let fun: (Bool) -> Bool? = object ?>> { $0.executeClosureWithParameterAndReturnOptional }
        object = nil
        XCTAssertNil(fun(true))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOptionalParameterResultSendable_called() {
        let fun: @Sendable (Bool) -> Bool? = sendableObject ?>> { $0.executeClosureWithParameterAndReturn }
        XCTAssertEqual(true, fun(true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalParameterResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool) -> Bool? = sendableObject ?>> { $0.executeClosureWithParameterAndReturn }
        sendableObject = nil
        XCTAssertNil(fun(true))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOptionalParameterResultOptionalSendable_called() {
        let fun: @Sendable (Bool) -> Bool? = sendableObject ?>> { $0.executeClosureWithParameterAndReturnOptional }
        XCTAssertEqual(true, fun(true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalParameterResultOptionalSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool) -> Bool? = sendableObject ?>> { $0.executeClosureWithParameterAndReturnOptional }
        sendableObject = nil
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

    func test_weakifyTwoParametersResultSendable_called() {
        let fun: @Sendable (Bool, Bool) -> Bool? = sendableObject ?>> { $0.executeBlockAndReturn(result:second:) }
        XCTAssertEqual(true, fun(true, true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyTwoParametersResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool, Bool) -> Bool? = sendableObject ?>> { $0.executeBlockAndReturn(result:second:) }
        sendableObject = nil
        XCTAssertNil(fun(true, true))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyTwoParametersOptionalResult_called() {
        let fun: (Bool, Bool) -> Bool? = object ?>> { $0.executeBlockAndReturnOptional(result:second:) }
        XCTAssertEqual(true, fun(true, true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyTwoParametersOptionalResult_notCalledOnObjectNil() {
        let fun: (Bool, Bool) -> Bool? = object ?>> { $0.executeBlockAndReturnOptional(result:second:) }
        object = nil
        XCTAssertNil(fun(true, true))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyTwoParametersOptionalResultSendable_called() {
        let fun: @Sendable (Bool, Bool) -> Bool? = sendableObject ?>> { $0.executeBlockAndReturnOptional(result:second:) }
        XCTAssertEqual(true, fun(true, true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyTwoParametersOptionalResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool, Bool) -> Bool? = sendableObject ?>> { $0.executeBlockAndReturnOptional(result:second:) }
        sendableObject = nil
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

    func test_weakifyOptionalTwoParametersOptionalResult_called() {
        let fun: (Bool, Bool) -> Bool? = object ?>> { $0.executeClosureWithTwoParametersAndReturnOptional }
        XCTAssertEqual(true, fun(true, true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalTwoParametersOptionalResult_notCalledOnObjectNil() {
        let fun: (Bool, Bool) -> Bool? = object ?>> { $0.executeClosureWithTwoParametersAndReturnOptional }
        object = nil
        XCTAssertNil(fun(true, true))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOptionalTwoParametersResultSendable_called() {
        let fun: @Sendable (Bool, Bool) -> Bool? = sendableObject ?>> { $0.executeClosureWithTwoParametersAndReturn }
        XCTAssertEqual(true, fun(true, true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalTwoParametersResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool, Bool) -> Bool? = sendableObject ?>> { $0.executeClosureWithTwoParametersAndReturn }
        sendableObject = nil
        XCTAssertNil(fun(true, true))
        XCTAssertFalse(isFunctionCalled)
    }

    func test_weakifyOptionalTwoParametersResultOptionalSendable_called() {
        let fun: @Sendable (Bool, Bool) -> Bool? = sendableObject ?>> { $0.executeClosureWithTwoParametersAndReturnOptional }
        XCTAssertEqual(true, fun(true, true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalTwoParametersResultOptionalSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool, Bool) -> Bool? = sendableObject ?>> { $0.executeClosureWithTwoParametersAndReturnOptional }
        sendableObject = nil
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

    func test_weakifyTwoParametersIgnoredResultSendable_called() {
        let fun: @Sendable (Bool, Bool) -> Bool? = sendableObject ?>> { $0.executeAndReturn }
        XCTAssertEqual(true, fun(true, true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyTwoParametersIgnoredResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool, Bool) -> Bool? = sendableObject ?>> { $0.executeAndReturn }
        sendableObject = nil
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

    func test_weakifyOptionalTwoParametersIgnoredResultSendable_called() {
        let fun: @Sendable (Bool, Bool) -> Bool? = sendableObject ?>> { $0.executeClosureAndReturn }
        XCTAssertEqual(true, fun(true, true))
        XCTAssertTrue(isFunctionCalled)
    }

    func test_weakifyOptionalTwoParametersIgnoredResultSendable_notCalledOnObjectNil() {
        let fun: @Sendable (Bool, Bool) -> Bool? = sendableObject ?>> { $0.executeClosureAndReturn }
        sendableObject = nil
        XCTAssertNil(fun(true, true))
        XCTAssertFalse(isFunctionCalled)
    }
}

private class MockObject {
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
    private(set) lazy var executeClosureWithTwoParametersAndReturn: ((Bool, Bool) -> Bool)? = { [weak self] in
        self?.block($0 && $1)

        return $0 && $1
    }
    private(set) lazy var executeClosureAndReturnOptional: (() -> Bool?)? = { [weak self] in
        self?.block(true)

        return true
    }
    private(set) lazy var executeClosureWithParameterAndReturnOptional: ((Bool) -> Bool?)? = { [weak self] in
        self?.block($0)

        return $0
    }
    private(set) lazy var executeClosureWithTwoParametersAndReturnOptional: ((Bool, Bool) -> Bool?)? = { [weak self] in
        self?.block($0 && $1)

        return $0 && $1
    }

    private let block: (Bool) -> Void

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

    func executeAndReturnOptional() -> Bool? {
        block(true)

        return true
    }

    func executeBlockAndReturnOptional(result: Bool) -> Bool? {
        block(result)

        return result
    }

    func executeBlockAndReturnOptional(result: Bool, second: Bool) -> Bool? {
        block(result && second)

        return result && second
    }
}

private final class SendableMockObject: Sendable {
    let executeClosure: (@Sendable () -> Void)?
    let executeClosureAndReturn: (@Sendable () -> Bool)?
    let executeClosureWithParameter: (@Sendable (Bool) -> Void)?
    let executeClosureWithParameterAndReturn: (@Sendable (Bool) -> Bool)?
    let executeClosureWithTwoParametersAndReturn: (@Sendable (Bool, Bool) -> Bool)?
    let executeClosureAndReturnOptional: (@Sendable () -> Bool?)?
    let executeClosureWithParameterAndReturnOptional: (@Sendable (Bool) -> Bool?)?
    let executeClosureWithTwoParametersAndReturnOptional: (@Sendable (Bool, Bool) -> Bool?)?

    private let block: @Sendable (Bool) -> Void

    init(block: @Sendable @escaping (Bool) -> Void) {
        self.block = block
        self.executeClosure = {
            block(true)
        }
        self.executeClosureAndReturn = {
            block(true)

            return true
        }
        self.executeClosureWithParameter = {
            block($0)
        }
        self.executeClosureWithParameterAndReturn = {
            block($0)

            return $0
        }
        self.executeClosureWithTwoParametersAndReturn = {
            block($0 && $1)

            return $0 && $1
        }
        self.executeClosureAndReturnOptional = {
            block(true)

            return true
        }
        self.executeClosureWithParameterAndReturnOptional = {
            block($0)

            return $0
        }
        self.executeClosureWithTwoParametersAndReturnOptional = {
            block($0 && $1)

            return $0 && $1
        }
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

    func executeAndReturnOptional() -> Bool? {
        block(true)

        return true
    }

    func executeBlockAndReturnOptional(result: Bool) -> Bool? {
        block(result)

        return result
    }

    func executeBlockAndReturnOptional(result: Bool, second: Bool) -> Bool? {
        block(result && second)

        return result && second
    }
}
