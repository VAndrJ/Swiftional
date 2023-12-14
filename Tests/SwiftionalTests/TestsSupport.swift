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

@Sendable
func aF2(_ a : Int, _ b : Int) async -> Int {
    a + b
}

func f2t(_ a : Int, _ b : Int) throws -> Int {
    f2(a, b)
}

@Sendable
func aF2T(_ a : Int, _ b : Int) async throws -> Int {
    await aF2(a, b)
}

func f3(_ a : Int, _ b : Int, _ c: Int) -> Int {
    a + b + c
}

@Sendable
func aF3(_ a : Int, _ b : Int, _ c: Int) async -> Int {
    a + b + c
}

func f3t(_ a : Int, _ b : Int, _ c: Int) throws -> Int {
    f3(a, b, c)
}

@Sendable
func aF3T(_ a : Int, _ b : Int, _ c: Int) async throws -> Int {
    await aF3(a, b, c)
}

func f4(_ a : Int, _ b : Int, _ c: Int, _ d: Int) -> Int {
    a + b + c + d
}

@Sendable
func aF4(_ a : Int, _ b : Int, _ c: Int, _ d: Int) async -> Int {
    a + b + c + d
}

func f4t(_ a : Int, _ b : Int, _ c: Int, _ d: Int) throws -> Int {
    f4(a, b, c, d)
}

@Sendable
func aF4T(_ a : Int, _ b : Int, _ c: Int, _ d: Int) async throws -> Int {
    await aF4(a, b, c, d)
}

func f5(_ a : Int, _ b : Int, _ c: Int, _ d: Int, _ e: Int) -> Int {
    a + b + c + d + e
}

@Sendable
func aF5(_ a : Int, _ b : Int, _ c: Int, _ d: Int, _ e: Int) async -> Int {
    a + b + c + d + e
}

func f6(_ a : Int, _ b : Int, _ c: Int, _ d: Int, _ e: Int, _ f: Int) -> Int {
    a + b + c + d + e + f
}

func f6T(_ a : Int, _ b : Int, _ c: Int, _ d: Int, _ e: Int, _ f: Int) throws -> Int {
    a + b + c + d + e + f
}

@Sendable
func aF6(_ a : Int, _ b : Int, _ c: Int, _ d: Int, _ e: Int, _ f: Int) async -> Int {
    a + b + c + d + e + f
}

@Sendable
func aF6T(_ a : Int, _ b : Int, _ c: Int, _ d: Int, _ e: Int, _ f: Int) async throws -> Int {
    await aF6(a, b, c, d, e, f)
}

func f5t(_ a : Int, _ b : Int, _ c: Int, _ d: Int, _ e: Int) throws -> Int {
    f5(a, b, c, d, e)
}

@Sendable
func aF5T(_ a : Int, _ b : Int, _ c: Int, _ d: Int, _ e: Int) async throws -> Int {
    await aF5(a, b, c, d, e)
}

@Sendable
func getString(_ a: Any) -> String {
    "\(a)"
}

@Sendable
func aGetString(_ a: Any) async -> String {
    "\(a)"
}

@Sendable
func mul(_ a: Int) -> Int {
    a * a
}

@Sendable
func aMul(_ a: Int) async -> Int {
    a * a
}

@Sendable
func mulT(_ a: Int) throws -> Int {
    mul(a)
}

@Sendable
func aMulT(_ a: Int) async throws -> Int {
    await aMul(a)
}

@Sendable
func getInt() -> Int {
    42
}

@Sendable
func aGetInt() async -> Int {
    42
}

@Sendable
func getIntT() throws -> Int {
    getInt()
}

@Sendable
func aGetIntT() async throws -> Int {
    await aGetInt()
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

func getIntInput() -> Int {
    Int.random(in: 0...128)
}
