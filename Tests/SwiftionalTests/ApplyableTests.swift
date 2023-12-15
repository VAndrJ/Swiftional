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

    func test_async_apply_closureApplied() async {
        let input = 2
        let sut = MockObjectActor()
        let result = await sut.apply {
            await $0.update(number: await aConst(input)())
        }
        await aXCTAssertEqual(input, await result.number)
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

    func test_async_applyThrows_closureApplied() async {
        let input = TestError.general
        let sut = MockObjectActor()
        do {
            try await sut.apply { _ in
                try? await Task.sleep(nanoseconds: 1)
                throw input
            }
        } catch {
            XCTAssertEqual(input, error as? TestError)
        }
    }

    func test_let_closureApplied() {
        let input = 2
        let sut = MockObject()
        let result = sut.let { _ in
            input
        }
        XCTAssertEqual(input, result)
    }

    func test_async_let_closureApplied() async {
        let input = 2
        let sut = MockObjectActor()
        let result = await sut.let { _ in
            await aConst(input)()
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

    func test_async_letThrows_closureApplied() async {
        let input = TestError.general
        let sut = MockObjectActor()
        do {
            try await sut.let { _ in
                try? await Task.sleep(nanoseconds: 1)
                throw input
            }
        } catch {
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

    func test_async_applied_closureApplied() async {
        let input = 2
        let sut = MockStruct()
        let result = await sut.applied {
            $0.number = await aConst(input)()
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

    func test_async_appliedThrows_closureApplied() async {
        let input = TestError.general
        let sut = MockStruct()
        do {
            _ = try await sut.applied { _ in
                try? await Task.sleep(nanoseconds: 1)
                throw input
            }
        } catch {
            XCTAssertEqual(input, error as? TestError)
        }
    }
}

private class MockObject: Applyable {
    var number: Int?
}

private actor MockObjectActor: Applyable, Sendable {
    var number: Int?

    func update(number: Int?) {
        self.number = number
    }
}

private struct MockStruct: Applyable, Sendable {
    var number: Int?
}
