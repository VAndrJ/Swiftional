//
//  CollectionTests.swift
//
//
//  Created by VAndrJ on 23.05.2024.
//

import XCTest
@testable import Swiftional

class CollectionTests: XCTestCase {

    func test_collection_nonEmpty() {
        XCTAssertTrue([1].isNonEmpty)
        XCTAssertFalse(Array<String>().isNonEmpty)
    }

    func test_optionalCollection_empty() {
        var sut: [Int]?

        XCTAssertTrue(sut.isEmptyOrNil)

        sut = []

        XCTAssertTrue(sut.isEmptyOrNil)

        sut = [1]

        XCTAssertFalse(sut.isEmptyOrNil)
    }

    func test_optionalCollection_nonEmpty() {
        var sut: [Int]?

        XCTAssertFalse(sut.isNonEmpty)

        sut = []

        XCTAssertFalse(sut.isNonEmpty)

        sut = [1]

        XCTAssertTrue(sut.isNonEmpty)
    }

    func test_collection_subscript() {
        var sut: [Int] = []

        XCTAssertNil(sut[at: 0])

        let expected = 42
        sut.append(expected)

        XCTAssertEqual(expected, sut[at: 0])
    }
}
