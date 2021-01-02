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
tree.append(5)
tree.append(9)

tree << 2
tree << 5
tree << 8

tree.append(8)
tree.append(1)
tree.append(3)
//tree.append(10)

print("-------- 结构 --------")
print(tree.description)

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

//var tree2: BST<Int> = [60,53,64,29,55,62,74,63,73,81]
//var tree2: BST<Int> = [60]
//tree2.traverseInOrder { print($0) }
//print(tree2.description)
//tree2.remove(60)
//print(tree2.description)
//tree2.remove(60)
//print(tree2.description)
//tree2.remove(55)
//print(tree2.description)
//tree2.remove(63)
//print(tree2.description)

//let tree8: BST<Int> = [5,3,8,1,4,6,9,2,7]
//print(tree8)


//let tree3: BST<Int> = [501,302,898,167,409,673,959,957,962,236,748]
//print(tree3)

let tree4: BST<Int> = [8, 3, 10, 1, 6, 14, 4, 7, 13]
print(tree4)
