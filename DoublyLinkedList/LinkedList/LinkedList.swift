//
//  LinkedList.swift
//  swift_algorithm
//
//  Created by AaronYin on 2020/11/14.
//

import Foundation

public final class LinkedList<Element> {
    
    fileprivate class LinkedListNode<Element> {
        
        var value: Element
        weak var previous: LinkedListNode?
        var next: LinkedListNode?
        
        init(value: Element) {
            self.value = value
        }
        
    }
    
    fileprivate typealias Node = LinkedListNode<Element>
    
    fileprivate var head: Node?
    fileprivate var tail: Node?
    
    private var _count: Int = 0
    
    // MARK: - Public
    
    /// 查询结点元素
    /// - Parameter index: 结点索引
    /// - Returns: 结点元素
    public func element(at index: Int)-> Element {
        node(at: index).value
    }
    
    /// 添加元素
    /// - Parameter value: 结点元素
    public func append(_ value: Element) {
        append(Node(value: value))
    }
    
    /// 插入元素
    /// - Parameters:
    ///   - value: 结点元素
    ///   - index: 结点索引
    public func insert(_ value: Element, at index: Int) {
        let newNode = Node(value: value)
        insert(newNode, at: index)
    }
    
    /// 移除结点
    /// - Parameter index: 结点索引
    /// - Returns: 结点元素
    @discardableResult
    public func remove(at index: Int) -> Element {
        if index == 0 {
            return removeHead()
        } else if index == count - 1 {
            return removeTail()
        } else {
            return remove(node(at: index))
        }
    }
    
    /// 移除头结点，如果链表为空，返回nil
    /// - Returns: 头结点元素
    @discardableResult
    public func popHead() -> Element? {
        isEmpty ? nil : removeHead()
    }
    
    /// 移除头结点，链表不能为空
    /// - Returns: 头结点
    @discardableResult
    public func removeHead() -> Element {
        guard let _head = head else {
            fatalError("Index is out of bounds")
        }
        head = _head.next
        _count -= 1
        return _head.value
    }
    
    /// 移除尾结点，如果链表为空，返回nil
    /// - Returns: 尾结点元素
    @discardableResult
    public func popTail() -> Element? {
        isEmpty ? nil : removeTail()
    }
    
    /// 移除尾结点，链表不能为空
    /// - Returns: 尾结点元素
    @discardableResult
    public func removeTail() -> Element {
        guard let _tail = tail else {
            fatalError("Index is out of bounds")
        }
        tail = _tail.previous
        _count -= 1
        return _tail.value
    }
    
    /// 移除所有结点
    public func removeAll() {
        head = nil
        _count = 0
    }
    
    // MARK: - private
    
    fileprivate func node(at index: Int) -> Node {
        if index < 0 {
            fatalError("Index must be greater or equal to 0")
        }
        if index >= count {
            fatalError("Index is out of bounds")
        }
        if index < (count >> 1) {
            guard var node = head else {
                fatalError("List is empty")
            }
            for _ in 0..<index {
                guard let next = node.next else {
                    fatalError("Index is out of bounds")
                }
                node = next
            }
            return node
        } else {
            guard var node = tail else {
                fatalError("List is empty")
            }
            for _ in index..<count - 1 {
                guard let previous = node.previous else {
                    fatalError("Index is out of bounds")
                }
                node = previous
            }
            return node
        }
    }
    
    fileprivate func append(_ newNode: Node) {
        insert(newNode, at: count)
    }
    
    fileprivate func insert(_ newNode: Node, at index: Int) {
        if index == 0 {
            newNode.next = head
            head = newNode
            if count == 0 { tail = newNode }
        } else if index == count {
            tail?.next = newNode
            newNode.previous = tail
            tail = newNode
        } else {
            let previousNode = node(at: index - 1)
            let nextNode = previousNode.next
            previousNode.next = newNode
            newNode.next = nextNode
        }
        _count += 1
    }
    
    fileprivate func remove(_ node: Node) -> Element {
        node.next?.previous = node.previous
        node.previous?.next = node.next
        _count -= 1
        return node.value
    }
    
}

extension LinkedList {
    
    public func reversed() {
        if isEmpty { return }
        tail = head
        var node = head
        while let currentNode = node {
            node = node?.next
            swap(&currentNode.previous, &currentNode.next)
            head = currentNode
        }
    }
    
    public func map<T>(_ transform: (Element) -> T) -> LinkedList<T> {
        let result = LinkedList<T>()
        forEach { result.append(transform($0)) }
        return result
    }
    
    public func filter(_ predicate: (Element) -> Bool) -> LinkedList<Element> {
        let result = LinkedList<Element>()
        for e in self {
            if predicate(e) {
                result.append(e)
            }
        }
        return result
    }
    
}

extension LinkedList: ExpressibleByArrayLiteral {

    public typealias ArrayLiteralElement = Element

    public convenience init(arrayLiteral elements: Element...) {
        self.init()
        elements.forEach { append($0) }
    }

}

extension LinkedList: Collection {
    
    public var count: Int { _count }
    
    public var startIndex: Int { 0 }
    
    public var endIndex: Int { _count }
    
    public subscript(position: Int) -> Element {
        element(at: position)
    }
    
    public func index(after i: Int) -> Int { i + 1 }
    
}

extension LinkedList: CustomStringConvertible where Element: CustomStringConvertible {
    
    public var description: String {
        var result = "["
        for (idx, e) in self.enumerated() {
            if idx != 0 {
                result += ", \(e)"
            } else {
                result += "\(e)"
            }
        }
        result += "]"
        return result
    }
    
}
