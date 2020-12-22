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

let tree2: BST<Int> = [164, 40, 900, 712, 428, 160, 958, 753, 255, 404, 258, 346, 876, 484, 225, 444, 837, 410, 339, 263, 878, 928, 883, 299, 87, 416]
print(tree2.description)

