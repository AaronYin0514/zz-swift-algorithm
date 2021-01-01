//
//  BST.swift
//  BST
//
//  Created by Aaron on 2020/12/19.
//

import Foundation

public struct BST<Element: Comparable> {
    
    var count = 0
    
    var height: Int {
        root?.height ?? 0
    }
    
    var isEmpty: Bool { count == 0 }
    
    typealias Node = BSTNode<Element>
    private var root: Node?
    
    public mutating func append(_ element: Element) {
        if let r = root {
            if r.append(Node(element)) {
                count += 1
            }
        } else {
            root = Node(element)
            count += 1
        }
    }
    
    public func contains(_ element: Element) -> Bool {
        root?.search(element) != nil
    }
    
    public mutating func removeAll() {
        root = nil
    }
    
    public mutating func remove(_ element: Element) {
        guard var node = root?.search(element) else {
            return
        }
        if node.degree == 2, let successor = node.successor {
            node.value = successor.value
            node = successor
        }
        if let replacement = node.left != nil ? node.left : node.right {
            replacement.parent = node.parent
            if node.isRoot {
                root = replacement
            } else if node.isLeft {
                node.parent?.left = replacement
            } else {
                node.parent?.right = replacement
            }
        } else {
            if node.isRoot {
                root = nil
            } else if node.isLeft {
                node.parent?.left = nil
            } else {
                node.parent?.right = nil
            }
        }
        count -= 1
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
            guard let node = queue.dequeue() else {
                continue
            }
            process(node.value)
            if let left = node.left {
                queue.enqueue(left)
            }
            if let right = node.right {
                queue.enqueue(right)
            }
        }
    }
    
}

final class BSTNode<E: Comparable>: Equatable {
    
    var value: E
    var left: BSTNode<E>?
    var right: BSTNode<E>?
    weak var parent: BSTNode<E>?
    
    init(_ value: E) {
        self.value = value
    }
    
    var count: Int {
        (left?.count ?? 0) + (right?.count ?? 0) + 1
    }
    
    var height: Int {
        max(left?.height ?? 0, right?.height ?? 0) + 1
    }
    
    var degree: Int {
        var r = 0
        if left != nil { r += 1 }
        if right != nil { r += 1 }
        return r
    }
    
    var isRoot: Bool {
        parent == nil
    }
    
    var isLeaf: Bool {
        left == nil && right == nil
    }
    
    var isLeft: Bool {
        self == parent?.left
    }
    
    var isRight: Bool {
        self == parent?.right
    }
    
    var predecessor: BSTNode<E>? {
        var p = left
        if p != nil {
            while p?.right != nil {
                p = p?.right
            }
            return p
        }
        p = self
        while p?.parent != nil && p == p?.parent?.left {
            p = p?.parent
        }
        return p?.parent
    }
    
    var successor: BSTNode<E>? {
        var p = right
        if p != nil {
            while p?.left != nil {
                p = p?.left
            }
            return p
        }
        p = self
        while p?.parent != nil && p == p?.parent?.right {
            p = p?.parent
        }
        return p?.parent
    }
    
    func append(_ node: BSTNode<E>) -> Bool {
        var n = self
        while true {
            if n.value < node.value {
                if let right = n.right {
                    n = right
                } else {
                    n.right = node
                    node.parent = n
                    return true
                }
            } else if n.value > node.value {
                if let left = n.left {
                    n = left
                } else {
                    n.left = node
                    node.parent = n
                    return true
                }
            } else {
                n.value = node.value
                return false
            }
        }
    }
    
    func search(_ element: E) -> BSTNode<E>? {
        var node: BSTNode<E>? = self
        while let n = node {
            if element < n.value {
                node = n.left
            } else if element > n.value {
                node = n.right
            } else {
                return n
            }
        }
        return node
    }
    
    func traversePreOrder(_ process: (E) -> Void) {
        process(value)
        left?.traversePreOrder(process)
        right?.traversePreOrder(process)
    }
    
    func traverseInOrder(_ process: (E) -> Void) {
        left?.traverseInOrder(process)
        process(value)
        right?.traverseInOrder(process)
    }
    
    func traversePostOrder(_ process: (E) -> Void) {
        left?.traversePostOrder(process)
        right?.traversePostOrder(process)
        process(value)
    }
    
    static func == (lhs: BSTNode<E>, rhs: BSTNode<E>) -> Bool {
        lhs.value == rhs.value
    }
    
}

extension BST: ExpressibleByArrayLiteral {
    
    public typealias ArrayLiteralElement = Element
    
    public init(arrayLiteral elements: Element...) {
        for e in elements {
            append(e)
        }
    }
}

extension BST {
    
    public func map<T>(formula: (Element) -> T) -> BST<T> {
        var tree = BST<T>()
        traverseLevelOrder {
            tree.append(formula($0))
        }
        return tree
    }
    
    public func flatMap<T>(formula: (Element) -> BST<T>) -> BST<T> {
        var tree = BST<T>()
        traverseLevelOrder {
            formula($0).traverseLevelOrder {
                tree.append($0)
            }
        }
        return tree
    }
    
    public func reducePreOrder<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) -> Result) -> Result {
        var result = initialResult
        traversePreOrder {
            result = nextPartialResult(result, $0)
        }
        return result
    }
    
    public func reduceInOrder<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) -> Result) -> Result {
        var result = initialResult
        traverseInOrder {
            result = nextPartialResult(result, $0)
        }
        return result
    }
    
    public func reducePostOrder<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) -> Result) -> Result {
        var result = initialResult
        traversePostOrder {
            result = nextPartialResult(result, $0)
        }
        return result
    }
    
    public func reduceLevelOrder<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) -> Result) -> Result {
        var result = initialResult
        traverseLevelOrder {
            result = nextPartialResult(result, $0)
        }
        return result
    }
    
}

// MARK: - Debugging

extension BST: CustomStringConvertible where Element: CustomStringConvertible {
    
    public var description: String {
        guard var levels = __levelDescription() else {
            return "null"
        }
        let maxCount = __stringMaxCount(in: levels)
        levels = __alignString(in: levels, maxCount)
        var result = __breakStrings(levels, maxCount)
        result = __removeEmptyCharacters(result)
        return __splicingCharacters(result)
    }
    
    @inline(__always)
    private func __levelDescription() -> [[String]]? {
        guard let node = root else { return nil }
        var levels: [[String]] = [[node.value.description]]
        var array: [Node?] = [node]
        while true {
            var strings = Array<String>()
            var temp: [Node?] = []
            for n in array {
                if let left = n?.left {
                    temp.append(left)
                    strings.append(left.value.description)
                } else {
                    temp.append(nil)
                    strings.append(" ")
                }
                if let right = n?.right {
                    temp.append(right)
                    strings.append(right.value.description)
                } else {
                    temp.append(nil)
                    strings.append(" ")
                }
            }
            if temp.compactMap({ $0 }).isEmpty {
                break
            } else {
                array = temp
                levels.append(strings)
            }
        }
        return levels
    }
    
    @inline(__always)
    private func __stringMaxCount(in array: [[String]]) -> Int {
        array.reduce(0) {
            $1.reduce($0) {
                max($1.count, $0)
            }
        }
    }
    
    @inline(__always)
    private func __alignString(in array: [[String]], _ count: Int) -> [[String]] {
        array.map({
            $0.map({
                $0 + " ".__repeating(count - $0.count)
            })
        })
    }
    
    @inline(__always)
    private func __repeatCount(_ count: Int, _ unitCount: Int) -> Int {
        (1 << count - 1) * unitCount
    }
    
    /// 0: left 1: double 2: right
    @inline(__always)
    private func __branch(_ count: Int, _ type: Int) -> String {
        func middleString(_ type: Int) -> String {
            if type == 0 {
                return "┙"
            } else if type == 1 {
                return "┷"
            } else {
                return "┕"
            }
        }
        var result = ""
        let middle = count / 2 - 1
        for i in 0..<count {
            if i < middle {
                if type == 2 {
                    result.append(" ")
                } else {
                    result.append("━")
                }
            } else if i > middle {
                if type == 0 {
                    result.append(" ")
                } else {
                    result.append("━")
                }
            } else {
                result.append(middleString(type))
            }
        }
        return result
    }
    
    @inline(__always)
    private func __breakStrings(_ array: [[String]], _ maxCount: Int) -> [[Character]] {
        var result: [[Character]] = []
        var temp: [Character] = []
        for (height, strings) in array.enumerated() {
            let pre = " ".__repeating(__repeatCount(array.count - height - 1, maxCount))
            let repeatCount = __repeatCount(array.count - height, maxCount)
            let space = " ".__repeating(repeatCount)
            if height != 0 {
                for (idx, str) in strings.enumerated() {
                    if idx == 0 {
                        temp.append(contentsOf: pre.characters)
                    }
                    if str.hasPrefix(" ") {
                        if idx + 1 < strings.count && strings[idx + 1].hasPrefix(" ") || idx % 2 != 0 {
                            temp.append(contentsOf: str.characters)
                            if idx != strings.count - 1 {
                                temp.append(contentsOf: space.characters)
                            }
                        }
                    } else {
                        if idx % 2 == 0 {
                            temp.append("┏")
                            for _ in 1..<maxCount {
                                temp.append("━")
                            }
                            if idx != strings.count - 1 {
                                var t = 0
                                if !strings[idx + 1].hasPrefix(" ") {
                                    t = 1
                                }
                                temp.append(contentsOf: __branch(repeatCount, t).characters)
                            }
                        } else {
                            if strings[idx - 1].hasPrefix(" ") {
                                for _ in 0..<maxCount {
                                    temp.append(" ")
                                }
                                temp.append(contentsOf: __branch(repeatCount, 2).characters)
                            }
                            temp.append("┓")
                            for _ in 1..<maxCount {
                                temp.append(" ")
                            }
                            if idx != strings.count - 1 {
                                temp.append(contentsOf: space.characters)
                            }
                        }
                    }
                }
                result.append(temp)
                temp = []
            }
            for (idx, str) in strings.enumerated() {
                if idx == 0 {
                    temp.append(contentsOf: pre.characters)
                }
                temp.append(contentsOf: str.characters)
                if idx != strings.count - 1 {
                    temp.append(contentsOf: space.characters)
                }
            }
            result.append(temp)
            temp = []
        }
        return result
    }
    
    @inline(__always)
    private func __splicingCharacters(_ array: [[Character]]) -> String {
        var result = ""
        array.forEach {
            $0.forEach { result.append($0) }
            result.append("\n")
        }
        return result
    }
    
    @inline(__always)
    private func __removeEmptyCharacters(_ array: [[Character]]) -> [[Character]] {
        if array.count == 0 { return [] }
        let emptyChars: [Character] = [" ", "━"]
        var results: [[Character]] = []
        for i in 0..<array.last!.count {
            var shouldRemoved = true
            for j in 0..<array.count {
                if i >= array[j].count { continue }
                if !emptyChars.contains(array[j][i]) {
                    shouldRemoved = false
                    break
                }
            }
            if shouldRemoved { continue }
            for j in 0..<array.count {
                if i >= array[j].count { continue }
                if j < results.count {
                    results[j].append(array[j][i])
                } else {
                    results.append([array[j][i]])
                }
            }
        }
        return results
    }
    
}

extension String {
    
    @inline(__always)
    func __repeating(_ count: Int) -> String {
        count <= 0 ? "" : String(repeating: self, count: count)
    }
    
//    public subscript(index: Int) -> Character? {
//        if index < 0 || index >= count { return nil }
//        let _startIndex = self.index(startIndex, offsetBy: index)
//        let _endIndex = self.index(startIndex, offsetBy: index + 1)
//        return Character(String(self[_startIndex..<_endIndex]))
//    }
    
    public var characters: [Character] {
        var result: [Character] = []
        forEach { result.append($0) }
        return result
    }
    
}
