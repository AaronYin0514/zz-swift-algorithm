//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by Aaron on 2020/11/23.
//

import Foundation

public enum BinarySearchTreeNode<T: Comparable> {
    
    case empty
    case leaf(T)
    indirect case node(BinarySearchTreeNode, T, BinarySearchTreeNode)
    
    public var count: Int {
        switch self {
        case .empty:
            return 0
        case .leaf(_):
            return 1
        case let .node(left, _, right):
            return left.count + 1 + right.count
        }
    }
    
    
    
}
