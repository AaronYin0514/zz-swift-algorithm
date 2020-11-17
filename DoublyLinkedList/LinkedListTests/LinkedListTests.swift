//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by AaronYin on 2020/11/14.
//

import XCTest
@testable import LinkedList

class LinkedListTests: XCTestCase {

    func testLinkedList() throws {
        /// 初始化
        let linkedList = LinkedList<Int>()
        /// count
        XCTAssertEqual(linkedList.count, 0)
        /// 增
        linkedList.append(0)
        XCTAssertEqual(linkedList.count, 1)
        XCTAssertEqual(linkedList.element(at: 0), 0)
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        linkedList.append(4)
        linkedList.append(5)
        linkedList.append(6)
        linkedList.append(7)
        XCTAssertEqual(linkedList.count, 8)
        /// 删
        XCTAssertEqual(linkedList.remove(at: 3), 3)
        XCTAssertEqual(linkedList.remove(at: 5), 6)
        /// 查询
        XCTAssertEqual(linkedList.element(at: 2), 2)
        XCTAssertEqual(linkedList.element(at: 5), 7)
        /// 去除表头
        XCTAssertEqual(linkedList.removeHead(), 0)
        let emptyLinkedList = LinkedList<Float>()
        XCTAssertEqual(emptyLinkedList.popHead(), nil)
        /// 去除表尾
        XCTAssertEqual(linkedList.removeTail(), 7)
        XCTAssertEqual(emptyLinkedList.popTail(), nil)
        
        /// 字面量初始化
        let linkedList2: LinkedList<String> = ["a", "b", "c", "d"]
        let array = ["a", "b", "c", "d"]
        /// 遍历
        for (idx, value) in linkedList2.enumerated() {
            XCTAssertEqual(value, array[idx])
        }
        /// 下表脚本访问
        XCTAssertEqual(linkedList2[0], "a")
        XCTAssertEqual(linkedList2[1], "b")
        XCTAssertEqual(linkedList2[2], "c")
        XCTAssertEqual(linkedList2[3], "d")
        
        /// 反转
        linkedList2.reversed()
        XCTAssertEqual(linkedList2[0], "d")
        XCTAssertEqual(linkedList2[1], "c")
        XCTAssertEqual(linkedList2[2], "b")
        XCTAssertEqual(linkedList2[3], "a")
        
    }

}
