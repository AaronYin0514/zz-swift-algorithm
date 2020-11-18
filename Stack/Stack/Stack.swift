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
    
    public mutating func clear() {
        array.removeAll()
    }
    
}

extension Stack: Sequence {
    
    public func makeIterator() -> AnyIterator<Element> {
        var stack = self
        return AnyIterator {
            stack.pop()
        }
    }
    
}

func isValidParentheses(_ parentheses: [String]) -> Bool {
    var stack = Stack<String>()
    let ps = [
        ")": "(",
        "]": "[",
        "}": "{",
    ]
    for p in parentheses {
        if ps.values.contains(p) {
            stack.push(p)
        } else if ps[p] == stack.top {
            _ = stack.pop()
        }
    }
    return stack.count == 0
}
