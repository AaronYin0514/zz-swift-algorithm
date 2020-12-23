//
//  BSTTest.swift
//  BSTTest
//
//  Created by Aaron on 2020/12/23.
//

import XCTest

class BSTTest: XCTestCase {

    func testBST() throws {
        var tree = BinarySearchTree<Int>()
        XCTAssertEqual(0, tree.count)
        tree.append(4)
        tree.append(9)
        tree.append(9)
        tree.append(2)
        tree.append(5)
        tree.append(8)
        tree.append(11)
        tree.append(1)
        tree.append(3)
        tree.append(10)
        tree.append(12)
        tree.append(3)
        tree.append(11)
        XCTAssertEqual(10, tree.count)
        XCTAssertEqual(true, tree.contains(value: 12))
        XCTAssertEqual(false, tree.contains(value: 7))
        XCTAssertEqual(4, tree.height)
        var r1 = ""
        tree.traversePreOrder {
            r1 += "\($0)"
        }
        XCTAssertEqual("4213958111012", r1)
        var r2 = ""
        tree.traverseInOrder {
            r2 += "\($0)"
        }
        XCTAssertEqual("1234589101112", r2)
        var r3 = ""
        tree.traversePostOrder {
            r3 += "\($0)"
        }
        XCTAssertEqual("1328510121194", r3)
        var r4 = ""
        tree.traverseLevelOrder {
            r4 += "\($0)"
        }
        XCTAssertEqual("4291351181012", r4)
    }

}
