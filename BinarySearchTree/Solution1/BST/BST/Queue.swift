//
//  Queue.swift
//  Queue
//
//  Created by Aaron on 2020/11/19.
//

import Foundation

public struct Queue<E> {
    
    fileprivate let linkedList = LinkedList<E>()

    /// 元素数量
    public var count: Int {
        return linkedList.count
    }
    
    /// 是否为空
    public var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    /// 入队
    public func enqueue(_ element: E) {
        linkedList.append(element)
    }

    /// 出队
    public func dequeue() -> E? {
        linkedList.popHead()
    }
    
    /// 清空
    public func clear() {
        linkedList.removeAll()
    }

    /// 队头元素
    public var front: E? {
        linkedList.isEmpty ? nil : linkedList.element(at: 0)
    }
    
}

extension Queue: Sequence {
    public func makeIterator() -> AnyIterator<E> {
        let queue = self
        return AnyIterator {
            queue.dequeue()
        }
    }
}
