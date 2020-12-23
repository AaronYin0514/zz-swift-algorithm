//
//  main.swift
//  BST
//
//  Created by Aaron on 2020/12/19.
//

import Foundation

var tree = BST<Int>()
tree.append(7)
tree.append(4)
tree.append(9)
//tree.append(2)
//tree.append(5)
tree.append(8)
tree.append(11)
//tree.append(1)
//tree.append(3)
tree.append(10)
tree.append(12)

print("-------- 结构 --------")
//print(tree.description)

//print("-------- 前序遍历 --------")
//tree.traversePreOrder {
//    print($0)
//}
//print("-------- 中序遍历 --------")
//tree.traverseInOrder {
//    print($0)
//}
//
//print("-------- 后序遍历 --------")
//tree.traversePostOrder {
//    print($0)
//}
//
//print("-------- 层序遍历 --------")
//tree.traverseLevelOrder {
//    print($0)
//}

//let newTree = tree.map {
//    $0 * 2
//}
//
//print("-------- 层序遍历(newTree) --------")
//newTree.traverseLevelOrder {
//    print($0)
//}

var tree2: BST<Int> = [60,53,64,29,55,62,74,63,73,81]
//var tree2: BST<Int> = [60]
//tree2.traverseInOrder { print($0) }
print(tree2.description)
tree2.remove(60)
print(tree2.description)
//tree2.remove(60)
//print(tree2.description)
//tree2.remove(55)
//print(tree2.description)
//tree2.remove(63)
//print(tree2.description)

// 1 删除叶子结点
// 1.1 删除的是根结点

// 1.2 左子结点

// 1.3 右子结点

// 2 删除度为1的结点
// 2.1 删除的是根结点

// 2.2 左子结点

// 2.3 右子结点

// 3 删除度为2的结点
// 3.1 后继结点为叶子结点

// 3.2 后继结点度为1
