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
    
    public var isEmpty: Bool {
        if case .empty = self {
            return true
        }
        return false
    }
    
    public var height: Int {
        switch self {
        case .empty:
            return 0
        case .leaf(_):
            return 1
        case let .node(left, _, right):
            return 1 + max(left.height, right.height)
        }
    }
    
    public mutating func append(_ newValue: T) {
        self = _append(newValue)
    }
    
    public mutating func removeAll() {
        self = .empty
    }
    
    // MARK: - Private
    
    private func _append(_ newValue: T) -> BinarySearchTreeNode {
        switch self {
        case .empty:
            return .leaf(newValue)
        case .leaf(let value):
            if newValue < value {
                return .node(.leaf(newValue), value, .empty)
            } else if newValue > value {
                return .node(.empty, value, .leaf(newValue))
            } else {
                return .leaf(newValue)
            }
        case .node(let left, let value, let right):
            if newValue < value {
                return .node(left._append(newValue), value, right)
            } else if newValue > value {
                return .node(left, value, right._append(newValue))
            } else {
                return .node(left, newValue, right)
            }
        }
    }
    
    
    
}
