//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by Aaron on 2020/11/23.
//

import Foundation

// MARK: - BinarySearchTree

public struct BinarySearchTree<Element: Comparable> {
    
    fileprivate typealias Node = BinarySearchTreeNode<Element>
    
    private var root: Node?
    
    public init(value: Element? = nil) {
        if value != value {
            root = .leaf(value!)
        }
    }
    
    public var count: Int {
        root?.count ?? 0
    }
    
    public var isEmpty: Bool {
        root != nil
    }
    
    public var height: Int {
        root?.height ?? 0
    }
    
    public mutating func append(_ newValue: Element) {
        root = root?.append(newValue) ?? .leaf(newValue)
    }
    
    public mutating func removeAll() {
        root = nil
    }
    
    public func contains(value: Element) -> Bool {
        root?.search(value) != nil
    }
    
    // MARK: - Traverse
    
    public func traversePreOrder(process: (Element) -> Void) {
        root?.traversePreOrder(process)
    }
    
    public func traverseInOrder(process: (Element) -> Void) {
        root?.traverseInOrder(process)
    }
    
    public func traversePostOrder(process: (Element) -> Void) {
        root?.traversePostOrder(process)
    }
    
    public func traverseLevelOrder(process: (Element) -> Void) {
        if root == nil { return }
        let queue = Queue<Node>()
        queue.enqueue(root!)
        while !queue.isEmpty {
            let node = queue.dequeue()
            switch node {
            case let .leaf(value):
                process(value)
            case let .node(left, value, right):
                process(value)
                if left != nil { queue.enqueue(left!) }
                if right != nil { queue.enqueue(right!) }
            default:
                continue
            }
        }
    }
    
    // MARK: - Remove
    
    public func remove(_ value: Element) -> BinarySearchTree<Element> {
        var tree = BinarySearchTree<Element>()
        traverseLevelOrder {
            if $0 != value {
                tree.append($0)
            }
        }
        return tree
    }
    
}

// MARK: - Extension Map

extension BinarySearchTree {
    
    public func map<T>(formula: (Element) -> T) -> BinarySearchTree<T> {
        var tree = BinarySearchTree<T>()
        traverseLevelOrder {
            tree.append(formula($0))
        }
        return tree
    }
    
    public func flatMap<T>(formula: (Element) -> BinarySearchTree<T>) -> BinarySearchTree<T> {
        var tree = BinarySearchTree<T>()
        traverseLevelOrder {
            formula($0).traverseLevelOrder {
                tree.append($0)
            }
        }
        return tree
    }
    
}

// MARK: - Node

enum BinarySearchTreeNode<T: Comparable> {
    
    case leaf(T)
    indirect case node(BinarySearchTreeNode?, T, BinarySearchTreeNode?)
    
    var count: Int {
        switch self {
        case .leaf(_):
            return 1
        case let .node(left, _, right):
            return (left?.count ?? 0) + 1 + (right?.count ?? 0)
        }
    }
    
    var height: Int {
        switch self {
        case .leaf(_):
            return 1
        case let .node(left, _, right):
            return 1 + max(left?.height ?? 0, right?.height ?? 0)
        }
    }
    
    var maxNode: BinarySearchTreeNode<T> {
        switch self {
        case let .node(_, _, right?):
            return right.maxNode
        default:
            return self
        }
    }
    
    var minNode: BinarySearchTreeNode<T> {
        switch self {
        case let .node(left?, _, _):
            return left.maxNode
        default:
            return self
        }
    }
    
    func append(_ newValue: T) -> BinarySearchTreeNode {
        switch self {
        case .leaf(let value):
            if newValue < value {
                return .node(.leaf(newValue), value, nil)
            } else if newValue > value {
                return .node(nil, value, .leaf(newValue))
            } else {
                return .leaf(newValue)
            }
        case let .node(left, value, right):
            if value == newValue {
                return .node(left, newValue, right)
            } else if newValue < value {
                let newLeft = left?.append(newValue) ?? .leaf(newValue)
                return .node(newLeft, newValue, right)
            } else {
                let newRight = right?.append(newValue) ?? .leaf(newValue)
                return .node(left, newValue, newRight)
            }
        }
    }
    
    func search(_ value: T) -> BinarySearchTreeNode<T>? {
        switch self {
        case let .leaf(_value) where _value == value:
            return self
        case let .node(_, _value, _) where _value == value:
            return self
        case let .node(left?, _value, _) where _value > value:
            return left.search(value)
        case let .node(_, _value, right?) where _value < value:
            return right.search(value)
        default:
            return nil
        }
    }
    
    func traversePreOrder(_ process: (T) -> Void) {
        switch self {
        case let .leaf(value):
            process(value)
        case let .node(left, value, right):
            process(value)
            left?.traversePreOrder(process)
            right?.traversePreOrder(process)
        }
    }
    
    func traverseInOrder(_ process: (T) -> Void) {
        switch self {
        case let .leaf(value):
            process(value)
        case let .node(left, value, right):
            left?.traverseInOrder(process)
            process(value)
            right?.traverseInOrder(process)
        }
    }
    
    func traversePostOrder(_ process: (T) -> Void) {
        switch self {
        case let .leaf(value):
            process(value)
        case let .node(left, value, right):
            left?.traversePostOrder(process)
            right?.traversePostOrder(process)
            process(value)
        }
    }
    
}
