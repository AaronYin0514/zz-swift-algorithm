//
//  MinHeap.swift
//  BinaryHeap
//
//  Created by Aaron on 2020/12/18.
//

import Foundation

public struct MinHeap<Element: Comparable> {
    
    private var nodes = [Element]()
    
    public var count: Int {
        nodes.count
    }
    
    public var isEmpty: Bool {
        nodes.isEmpty
    }
    
    public func peek() -> Element? {
        nodes.first
    }
    
    public mutating func insert(_ element: Element) {
        nodes.append(element)
        siftUp(count - 1)
    }
    
    public mutating func remove() -> Element? {
        guard let last = nodes.last else { return nil }
        let node = nodes.first
        nodes[0] = last
        nodes.removeLast()
        siftDown(0)
        print("--------------------------")
        print(nodes)
        return node
    }
    
    public mutating func replace(_ element: Element) -> Element? {
        var top: Element?
        if count == 0 {
            nodes.append(element)
        } else {
            top = nodes.first
            nodes[0] = element
            siftDown(0)
        }
        return top
    }
    
    private mutating func siftUp(_ index: Int) {
        var i = index
        let n = nodes[i]
        while i > 0 {
            let parentIndex = (i - 1) >> 1
            let parent = nodes[parentIndex]
            if n >= parent { break }
            nodes[i] = parent
            i = parentIndex
        }
        nodes[i] = n
    }
    
    private mutating func siftDown(_ index: Int) {
        if index >= count { return }
        var i = index
        let n = nodes[i]
        let half = count >> 1
        func minNode(_ l: Int, _ r: Int) -> (Int, Element) {
            if r >= count { return (l, nodes[l]) }
            let n1 = nodes[l], n2 = nodes[r]
            return n1 < n2 ? (l, n1) : (r, n2)
        }
        while i < half {
            let leftIndex = i << 1 + 1
            let rightIndex = leftIndex + 1
            let r = minNode(leftIndex, rightIndex)
            if n <= r.1 { break }
            nodes[i] = r.1
            i = r.0
        }
        nodes[i] = n
    }
    
}

extension MinHeap: ExpressibleByArrayLiteral {
    
    public typealias ArrayLiteralElement = Element
    
    public init(arrayLiteral elements: Element...) {
        nodes = elements
        for i in 1..<count {
            siftUp(i)
        }
        print(nodes)
    }
}
