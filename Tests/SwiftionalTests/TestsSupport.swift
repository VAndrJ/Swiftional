//
//  TestsSupport.swift
//  
//
//  Created by Volodymyr Andriienko on 07.02.2022.
//

import Foundation

func generateTestIntArray(length: Int) -> [Int] {
    (0..<length).map { _ in Int.random(in: Int.min...Int.max) / length }
}

func f2(_ a : Int, _ b : Int) -> Int {
    a + b
}

func f2t(_ a : Int, _ b : Int) throws -> Int {
    f2(a, b)
}

func f3(_ a : Int, _ b : Int, _ c: Int) -> Int {
    a + b + c
}

func f3t(_ a : Int, _ b : Int, _ c: Int) throws -> Int {
    f3(a, b, c)
}

func f4(_ a : Int, _ b : Int, _ c: Int, _ d: Int) -> Int {
    a + b + c + d
}

func f4t(_ a : Int, _ b : Int, _ c: Int, _ d: Int) throws -> Int {
    f4(a, b, c, d)
}

func f5(_ a : Int, _ b : Int, _ c: Int, _ d: Int, _ e: Int) -> Int {
    a + b + c + d + e
}

func f5t(_ a : Int, _ b : Int, _ c: Int, _ d: Int, _ e: Int) throws -> Int {
    f5(a, b, c, d, e)
}

func getString(_ a: Any) -> String {
    "\(a)"
}

func mul(_ a: Int) -> Int {
    a * a
}

func mult(_ a: Int) throws -> Int {
    mul(a)
}

func getInt() -> Int {
    42
}

func getIntt() throws -> Int {
    getInt()
}

func getErrorResult(_ a: Int, completion: @escaping (Result<Int, TestError>) -> Void) {
    completion(.failure(.general))
}

func getIdentityResult(_ a: Int, completion: @escaping (Result<Int, TestError>) -> Void) {
    completion(.success(a))
}

enum TestError: Error {
    case general
}
