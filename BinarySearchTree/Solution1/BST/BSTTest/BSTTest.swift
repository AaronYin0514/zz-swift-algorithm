//
//  BSTTest.swift
//  BSTTest
//
//  Created by Aaron on 2020/12/23.
//

import XCTest

class BSTTest: XCTestCase {

    func testAdd() throws {
        var tree = BST<Int>()
        XCTAssertEqual(true, tree.isEmpty)
        tree.append(4)
        tree.append(5)
        tree.append(9)
        tree.append(2)
        tree.append(5)
        tree.append(8)
        tree.append(8)
        tree.append(11)
        tree.append(1)
        tree.append(3)
        tree.append(10)
        tree.append(12)
        tree.append(3)
        print(tree)
        XCTAssertEqual(10, tree.count)
        XCTAssertEqual(5, tree.height)
        XCTAssertEqual(true, tree.contains(8))
        XCTAssertEqual(false, tree.contains(7))
    }
    
    func testTraversePreOrder() throws {
        let tree: BST<Int> = [4,9,2,5,8,11,1,3,10,12]
        XCTAssertEqual("4213958111012", tree.reducePreOrder("", {
            $0 + "\($1)"
        }))
    }
    
    func testTraverseInOrder() throws {
        let tree: BST<Int> = [4,9,2,5,8,11,1,3,10,12]
        XCTAssertEqual("1234589101112", tree.reduceInOrder("", {
            $0 + "\($1)"
        }))
    }
    
    func testTraversePostOrder() throws {
        let tree: BST<Int> = [4,9,2,5,8,11,1,3,10,12]
        XCTAssertEqual("1328510121194", tree.reducePostOrder("", {
            $0 + "\($1)"
        }))
    }
    
    func testTraverseLevelOrder() throws {
        let tree: BST<Int> = [4,9,2,5,8,11,1,3,10,12]
        XCTAssertEqual("4291351181012", tree.reduceLevelOrder("", {
            $0 + "\($1)"
        }))
    }
    
    func testRemove() throws {
        // 1 删除叶子结点
        // 1.1 删除的是根结点
        var tree1: BST<Int> = [4]
        tree1.remove(4)
        XCTAssertEqual("", tree1.reduceInOrder("", {
            $0 + "\($1)"
        }))
        // 1.2 左子结点
        var tree2: BST<Int> = [7,4,9,2,5,8,11,1,3,10,12]
        tree2.remove(10)
        tree2.remove(1)
        XCTAssertEqual("23457891112", tree2.reduceInOrder("", {
            $0 + "\($1)"
        }))
        print(tree2)
        // 1.3 右子结点
        var tree3: BST<Int> = [7,4,9,2,5,8,11,1,3,10,12]
        //"12345789101112"
        tree3.remove(3)
        tree3.remove(12)
        print(tree3)
        XCTAssertEqual("12457891011", tree3.reduceInOrder("", {
            $0 + "\($1)"
        }))
        // 2 删除度为1的结点
        // 2.1 删除的是根结点
        var tree4: BST<Int> = [3,5,7,9,11,13]
        //"35791113"
        print(tree4)
        tree4.remove(3)
        print(tree4)
        XCTAssertEqual("5791113", tree4.reduceInOrder("", {
            $0 + "\($1)"
        }))
        // 2.2 左子结点
        var tree5: BST<Int> = [7,4,9,2,11,1,3,10,12]
        //"123479101112"
        print(tree5)
        tree5.remove(4)
        print(tree5)
        XCTAssertEqual("12379101112", tree5.reduceInOrder("", {
            $0 + "\($1)"
        }))
        // 2.3 右子结点
        var tree6: BST<Int> = [7,4,9,2,11,1,3,10,12]
//        "123479101112"
        print(tree6)
        tree6.remove(9)
        print(tree6)
        XCTAssertEqual("12347101112", tree6.reduceInOrder("", {
            $0 + "\($1)"
        }))
        // 3 删除度为2的结点
        // 3.1 后继结点为叶子结点
        var tree7: BST<Int> = [5,3,8,1,4,6,9,2,7]
        //"123456789"
        print(tree7)
        tree7.remove(3)
        print(tree7)
        XCTAssertEqual("12456789", tree7.reduceInOrder("", {
            $0 + "\($1)"
        }))
        // 3.2 后继结点度为1
        var tree8: BST<Int> = [5,3,8,1,4,6,9,2,7]
        //"123456789"
        print(tree8)
        tree8.remove(5)
        print(tree8)
        XCTAssertEqual("12346789", tree8.reduceInOrder("", {
            $0 + "\($1)"
        }))
    }

}
