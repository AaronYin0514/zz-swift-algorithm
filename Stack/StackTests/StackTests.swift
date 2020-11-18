//
//  StackTests.swift
//  StackTests
//
//  Created by Aaron on 2020/11/17.
//

import XCTest
@testable import Stack

class StackTests: XCTestCase {

    func testExample() throws {
        
        // 遍历
        
        var stack1 = Stack<String>()
        stack1.push("a")
        stack1.push("b")
        stack1.push("c")
        stack1.push("d")
        
        XCTAssertEqual(stack1.count, 4)
        XCTAssertEqual(stack1.top, "d")
        
        let arr = ["a", "b", "c", "d"]
        for (idx, e) in stack1.enumerated() {
            XCTAssertEqual(e, arr[idx])
        }
        
        // 括号识别
        
        let arr1 = ["(", ")"]
        let arr2 = ["(", ")", "[", "]", "{", "}"]
        let arr3 = ["(", "]"]
        let arr4 = ["(", "[", ")", "]"]
        let arr5 = ["{", "[", "]", "}"]
        
        XCTAssertEqual(isValidParentheses(arr1), true)
        XCTAssertEqual(isValidParentheses(arr2), true)
        XCTAssertEqual(isValidParentheses(arr3), false)
        XCTAssertEqual(isValidParentheses(arr4), false)
        XCTAssertEqual(isValidParentheses(arr5), true)
    }

}
