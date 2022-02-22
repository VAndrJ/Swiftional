//
//  UnitTests.swift
//  
//
//  Created by Volodymyr Andriienko on 22.02.2022.
//

import Foundation

import XCTest
@testable import Swiftional

class UnitTests: XCTestCase {

    func test_unit_monoidEmpty() {
        XCTAssertEqual(unit, Unit.empty)
    }

    func test_unit_semigroupCombine() {
        XCTAssertEqual(unit, unit.combine(unit))
    }

    func test_unit_description() {
        XCTAssertEqual("()", unit.description)
    }

    func test_unit_debugDescription() {
        XCTAssertEqual("()", unit.debugDescription)
    }
}
