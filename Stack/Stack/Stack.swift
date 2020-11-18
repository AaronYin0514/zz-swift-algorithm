//
//  Stack.swift
//  Stack
//
//  Created by Aaron on 2020/11/18.
//

import Foundation

public struct Stack<Element> {
    
    private var array = [Element]()
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var count: Int {
        array.count
    }
    
    public var top: Element? {
        array.last
    }
    
    public mutating func push(_ e: Element) {
        array.append(e)
    }
    
    public mutating func pop() -> Element? {
        array.popLast()
    }
    
}
