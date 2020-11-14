//
//  BigOTests.swift
//  BigOTests
//
//  Created by AaronYin on 2020/11/14.
//

import XCTest
@testable import BigO

class BigOTests: XCTestCase {

    func testFib1() throws {
        XCTAssertEqual(5, fib1(5))
        XCTAssertEqual(21, fib1(8))
        XCTAssertEqual(89, fib1(11))
        XCTAssertEqual(233, fib1(13))
    }
    
    func testFib2() throws {
        XCTAssertEqual(5, fib2(5))
        XCTAssertEqual(21, fib2(8))
        XCTAssertEqual(89, fib2(11))
        XCTAssertEqual(233, fib2(13))
    }

}
