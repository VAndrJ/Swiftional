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

func f3(_ a : Int, _ b : Int, _ c: Int) -> Int {
    a + b + c
}

func f4(_ a : Int, _ b : Int, _ c: Int, _ d: Int) -> Int {
    a + b + c + d
}

func f5(_ a : Int, _ b : Int, _ c: Int, _ d: Int, _ e: Int) -> Int {
    a + b + c + d + e
}

func getString(_ a: Any) -> String {
    "\(a)"
}
