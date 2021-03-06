//
//  main.swift
//  BinarySearchTree
//
//  Created by Aaron on 2020/12/23.
//

import Foundation

var tree = BinarySearchTree<Int>()
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

print("-------- 前序遍历 --------")
tree.traversePreOrder {
    print($0)
}
print("-------- 中序遍历 --------")
tree.traverseInOrder {
    print($0)
}

print("-------- 后序遍历 --------")
tree.traversePostOrder {
    print($0)
}

print("-------- 层序遍历 --------")
tree.traverseLevelOrder {
    print($0)
}

//let newTree = tree.map {
//    $0 * 2
//}
//
//print("-------- 层序遍历(newTree) --------")
//newTree.traverseLevelOrder {
//    print($0)
//}

