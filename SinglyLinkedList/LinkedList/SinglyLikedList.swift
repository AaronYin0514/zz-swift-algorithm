//
//  SinglyLikedList.swift
//  swift_algorithm
//
//  Created by AaronYin on 2020/11/14.
//

import Foundation

public final class SinglyLinkedList<Element> {
    
    fileprivate class LinkedListNode<Element> {
        
        var value: Element
        
        var next: LinkedListNode?
        
        init(value: Element) {
            self.value = value
        }
        
    }
    
    fileprivate typealias Node = LinkedListNode<Element>
    
    fileprivate var head: Node?
    private var _count: Int = 0
    
    // MARK: - Public
    
    /// 根据索引查找节点元素
    /// - Parameter index: 节点元素索引
    /// - Returns: 节点元素
    public func element(at index: Int)-> Element {
        node(at: index).value
    }
    
    /// 添加节点
    /// - Parameter value: 节点元素
    public func append(_ value: Element) {
        append(Node(value: value))
    }
    
    /// 插入节点
    /// - Parameters:
    ///   - value: 节点元素
    ///   - index: 节点索引
    public func insert(_ value: Element, at index: Int) {
        let newNode = Node(value: value)
        insert(newNode, at: index)
    }
    
    
    /// 移除节点
    /// - Parameter index: 节点索引
    /// - Returns: 移除的元素值
    @discardableResult
    public func remove(at index: Int) -> Element {
        removeNode(after: index == 0 ? nil : node(at: index - 1))
    }
    
    /// 移除头节点，空链表返回nil
    /// - Returns: 头元素
    @discardableResult
    public func popHead() -> Element? {
        isEmpty ? nil : removeHead()
    }
    
    /// 移除头节点，链表不能为空链表
    /// - Returns: 头元素
    @discardableResult
    public func removeHead() -> Element {
        remove(at: 0)
    }
    
    /// 移除尾节点，空链表返回nil
    /// - Returns: 尾元素
    @discardableResult
    public func popTail() -> Element? {
        isEmpty ? nil : removeTail()
    }
    
    /// 移除尾节点，链表不能为空链表
    /// - Returns: 尾元素
    @discardableResult
    public func removeTail() -> Element {
        remove(at: _count - 1)
    }
    
    /// 移除所有节点
    public func removeAll() {
        head = nil
        _count = 0
    }
    
    // MARK: - private
    
    fileprivate func node(at index: Int) -> Node {
        if index < 0 {
            fatalError("Index must be greater or equal to 0")
        }
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
    }
    
    fileprivate func append(_ newNode: Node) {
        insert(newNode, at: count)
    }
    
    fileprivate func insert(_ newNode: Node, at index: Int) {
        if index == 0 {
            newNode.next = head
            head = newNode
        } else {
            let previousNode = node(at: index - 1)
            let nextNode = previousNode.next
            previousNode.next = newNode
            newNode.next = nextNode
        }
        _count += 1
    }
    
    fileprivate func removeNode(after previousNode: Node?) -> Element {
        if let _previousNode = previousNode {
            guard let node = _previousNode.next else {
                fatalError("Index is out of bounds")
            }
            _previousNode.next = _previousNode.next?.next
            _count -= 1
            return node.value
        } else {
            /// Head
            guard let _head = head else {
                fatalError("List is empty")
            }
            head = _head.next
            _count -= 1
            return _head.value
        }
    }
    
}

extension SinglyLinkedList {
    
    public func reversed() {
        var _node: Node? = nil
        while _node != nil {
            let _head = head?.next
            head?.next = _node
            _node = head
            head = _head
        }
    }
    
    public func map<T>(_ transform: (Element) -> T) -> SinglyLinkedList<T> {
        let result = SinglyLinkedList<T>()
        forEach { result.append(transform($0)) }
        return result
    }
    
    public func filter(_ predicate: (Element) -> Bool) -> SinglyLinkedList<Element> {
        let result = SinglyLinkedList<Element>()
        for e in self {
            if predicate(e) {
                result.append(e)
            }
        }
        return result
    }
    
}

extension SinglyLinkedList: ExpressibleByArrayLiteral {

    public typealias ArrayLiteralElement = Element

    public convenience init(arrayLiteral elements: Element...) {
        self.init()
        elements.forEach { append($0) }
    }

}

extension SinglyLinkedList: Collection {
    
    public var count: Int { _count }
    
    public var startIndex: Int { 0 }
    
    public var endIndex: Int { _count }
    
    public subscript(position: Int) -> Element {
        element(at: position)
    }
    
    public func index(after i: Int) -> Int { i + 1 }
    
}

extension SinglyLinkedList: CustomStringConvertible where Element: CustomStringConvertible {
    
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

