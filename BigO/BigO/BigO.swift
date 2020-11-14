//
//  BigO.swift
//  BigO
//
//  Created by AaronYin on 2020/11/14.
//

import Foundation

func fib1(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    return fib1(n - 1) + fib1(n - 2)
}

func fib2(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    var first = 0
    var second = 1
    for _ in 2...n {
        second += first
        first = second - first
    }
    return second
}

func performanceMeasure(f: () -> Void) {
    let start = Date().timeIntervalSince1970
    f()
    let end = Date().timeIntervalSince1970
    print("函数耗时：\(end - start)s")
}

// 时间复杂度

func test1() {
    for _ in 0..<4 {
        print("test")
    }
}

func test2(_ n: Int) {
    for _ in 0..<(2 * n) {
        print("test")
    }
}

func test3(_ n: Int) {
    for _ in 0..<n {
        for _ in 0..<n {
            print("test")
        }
    }
}

func test4(_ n: Int) {
    var m = n
    while m > 0 {
        m /= 2
        print("test")
    }
}

func test5(_ n: Int) {
    var m = 1
    while m < n {
        m *= 2
        for _ in 0..<n {
            print("test")
        }
    }
}

// 空间复杂度

func test11() {
    var i = 0
    var j = 0
    i += 1
    j += 1
}

func test12(_ n: Int) {
    var arr: [Int] = []
    for i in 0..<n {
        arr.append(i)
    }
}
