//
//  BinaryHeap.swift
//  BinaryHeap
//
//  Created by Aaron on 2020/12/16.
//

import Foundation

@inline(__always)
internal func _binaryHeapParentIndex(ofIndex i: Int) -> Int {
    (i - 1) >> 2
}

@inline(__always)
internal func _binaryHeapLeftChildIndex(ofIndex i: Int) -> Int {
    i << 2 + 1
}

@inline(__always)
internal func _binaryHeapRightChildIndex(ofIndex i: Int) -> Int {
    i << 2 + 2
}

public struct MaxHeap<Element: Comparable> {
    
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
        fatalError()
    }
    
    private mutating func siftUp(_ index: Int) {
        var _index = index
        let _n = nodes[_index]
        while _index > 0 {
            let parentIndex = _binaryHeapParentIndex(ofIndex: _index)
            let parent = nodes[parentIndex]
            if _n > parent {
                nodes[_index] = parent
                _index = parentIndex
            } else {
                break
            }
        }
        nodes[_index] = _n
    }
    
    
    
}

public struct MinHeap<Element> {
    
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
        fatalError()
    }
    
    public mutating func remove() -> Element? {
        fatalError()
    }
    
}
