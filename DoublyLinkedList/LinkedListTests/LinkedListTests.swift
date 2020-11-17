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
        XCTAssertEqual(linkedList.count, 4)
        /// 删
        linkedList.remove(at: <#T##Int#>)
        /// 查询
        
        /// 去除表头
        
        /// 去除表尾
        
        /// 遍历
        
        /// 字面量初始化
        
        /// 下表脚本访问
        
        /// 反转
        
        /// 打印
        
    }

}
