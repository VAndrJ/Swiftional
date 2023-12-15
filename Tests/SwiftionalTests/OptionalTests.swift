//
//  OptionalTests.swift
//  
//
//  Created by Volodymyr Andriienko on 20.09.2022.
//

import XCTest
@testable import Swiftional

class OptionalTests: XCTestCase {
    
    func test_optionalValue_foldIdentityEquals() {
        let expected = "test"
        let optional: String? = expected
        XCTAssertEqual(expected, optional.fold(constant("fail"), identity))
    }

    func test_async_optionalValue_foldIdentityEquals() async {
        let expected = "test"
        let optional: String? = expected
        await aXCTAssertEqual(expected, await optional.fold(aConst("fail"), id))
    }
    
    func test_optionalNil_foldConstantEquals() {
        let expected = "test"
        let optional: String? = nil
        XCTAssertEqual(expected, optional.fold(constant("test"), constant("fail")))
    }

    func test_async_optionalNil_foldConstantEquals() async {
        let expected = "test"
        let optional: String? = nil
        await aXCTAssertEqual(expected, await optional.fold(aConst("test"), aConst("fail")))
    }
}
