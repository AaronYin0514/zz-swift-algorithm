//
//  main.swift
//  AVLTree
//
//  Created by Aaron on 2020/12/29.
//

import Foundation

print("Hello, World!")

//13 14 15 12 11 17 16 8 9 1

var tree: AVLTree<Int> = [13]
tree << 14
print(tree)

tree << 15
print(tree)

tree << 12
print(tree)

tree << 11
print(tree)

tree << 17
print(tree)

tree << 16
print(tree)

tree << 8
print(tree)

tree << 9
print(tree)

tree << 1
print(tree)

tree.remove(15)
print(tree)
tree.remove(17)

print(tree)
