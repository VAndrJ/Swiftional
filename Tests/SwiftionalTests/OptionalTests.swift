//
//  OptionalTests.swift
//  
//
//  Created by VAndrJ on 20.09.2022.
//

import XCTest
@testable import Swiftional

class OptionalTests: XCTestCase {
    
    func test_optionalValue_foldIdentityEquals() {
        let expected = "test"
        let optional: String? = expected
        XCTAssertEqual(expected, optional.fold(constant("fail"), identity))
    }
    
    func test_optionalNil_foldConstantEquals() {
        let expected = "test"
        let optional: String? = nil
        XCTAssertEqual(expected, optional.fold(constant("test"), constant("fail")))
    }
}
