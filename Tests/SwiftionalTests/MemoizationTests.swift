//
//  MemoizationTests.swift
//  
//
//  Created by VAndrJ on 06.12.2023.
//

import XCTest
@testable import Swiftional

func fibonacci(_ n: Int) -> Int {
    n < 2 ? 1 : fibonacci(n - 1) + fibonacci(n - 2)
}

let memoizedFibonacci = memoize(f: fibonacci(_:))

func nFib(n: Int, k: Int) -> Int {
    n < 2 || k < 2 ? 1 : nFib(n: n - 1, k: k - 1) + nFib(n: n - 2, k: k - 2)
}

let memoizedNFib = memoize(f: nFib(n:k:))

class MemoizationTests: XCTestCase {
    let runsCount = 128
    let values = 0..<32
    lazy var pairs = values.flatMap { n in (0...n).map { k in (n, k) } }
    let rmemoizedFibonacci = rmemoize { fibonacci, n in n < 2 ? 1 : fibonacci(n - 1) + fibonacci(n - 2) }
    lazy var rmemoizedNFib = rmemoize { (nFib: ((Int, Int) -> Int), n, k) in
        n < 2 || k < 2 ? 1 : nFib(n - 1, k - 1) + nFib(n - 2, k - 2)
    }

    func test_memoization_fibonacci() {
        for i in values.shuffled() {
            XCTAssertEqual(fibonacci(i), memoizedFibonacci(i))
        }
    }

    func test_rmemoization_fibonacci() {
        for i in values.shuffled() {
            XCTAssertEqual(fibonacci(i), rmemoizedFibonacci(i))
        }
    }

    func test_memoization_nChooseK() {
        for (n, k) in pairs.shuffled() {
            XCTAssertEqual(nFib(n: n, k: k), memoizedNFib(n, k))
        }
    }

    func test_rmemoization_nChooseK() {
        for (n, k) in pairs.shuffled() {
            XCTAssertEqual(nFib(n: n, k: k), rmemoizedNFib(n, k))
        }
    }

    func test_fibonacci_performance() {
        measure {
            for _ in 0..<runsCount {
                for k in values.shuffled() {
                    _ = fibonacci(k)
                }
            }
        }
    }

    func test_rmemoizedFibonacci_performance() {
        measure {
            let sut = rmemoizedFibonacci
            for _ in 0..<runsCount {
                for k in values.shuffled() {
                    _ = sut(k)
                }
            }
        }
    }

    func test_memoizedFibonacci_performance() {
        measure {
            let sut = memoizedFibonacci
            for _ in 0..<runsCount {
                for k in values.shuffled() {
                    _ = sut(k)
                }
            }
        }
    }

    func test_nChooseK_performance() {
        measure {
            for _ in 0..<runsCount {
                for (n, k) in pairs.shuffled() {
                    _ = nFib(n: n, k: k)
                }
            }
        }
    }

    func test_rmemoizedNChooseK_performance() {
        measure {
            let sut = rmemoizedNFib
            for _ in 0..<runsCount {
                for (n, k) in pairs.shuffled() {
                    _ = sut(n, k)
                }
            }
        }
    }

    func test_memoizedNChooseK_performance() {
        measure {
            let sut = memoizedNFib
            for _ in 0..<runsCount {
                for (n, k) in pairs.shuffled() {
                    _ = sut(n, k)
                }
            }
        }
    }
}
