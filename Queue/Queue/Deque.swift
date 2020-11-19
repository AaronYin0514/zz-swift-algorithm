//
//  Deque.swift
//  Queue
//
//  Created by Aaron on 2020/11/19.
//

import Foundation

public struct Deque<E> {
    
    fileprivate let linkedList = LinkedList<E>()

    /// 元素数量
    public var count: Int {
        return linkedList.count
    }
    
    /// 是否为空
    public var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    /// 队头入队
    public func enqueueFront(_ element: E) {
        linkedList.insert(element, at: 0)
    }

    /// 队头出队
    public func dequeueFront() -> E? {
        linkedList.popHead()
    }
    
    /// 对尾入队
    public func enqueueRear(_ element: E) {
        linkedList.append(element)
    }
    
    /// 队尾出队
    public func dequeueRear() -> E? {
        linkedList.popTail()
    }
    
    /// 清空
    public func clear() {
        linkedList.removeAll()
    }

    /// 队头元素
    public var front: E? {
        linkedList.isEmpty ? nil : linkedList.element(at: 0)
    }
    
    /// 队尾元素
    public var rear: E? {
        linkedList.isEmpty ? nil : linkedList.element(at: count - 1)
    }
    
}
