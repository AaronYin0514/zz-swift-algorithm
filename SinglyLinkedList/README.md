## 单向链表

> 链表：
> 线性表的链式存储的特点是用一组**任意的**存储单元存储线性表的数据元素。因此，为了表示每个数据元素a(i)与其直接后继数据元素a(i+1)之间的逻辑关系，对数据元素a(i)来说，除了存储其本身的信息之外，还需存储一个指示其直接后继的信息。这两部分信息组成数据元素a(i)的存储映象，称为**节点**。它包含两个域：其中存储数据元素信息的域称为**数据域**；存储直接后继存储位置的域称为**指针域**。指针域中存储的信息称做**指针**或**链**。n个结点链结成一个**链表**。

### 单向链表

> 链表的每一个结点中只包含一个指针域，称为线性链表或单链表。

![singly_linked_list](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/SinglyLinkedList/singly_linked_list.png)

### 双向链表

> 在双向链表的结点中有两个指针域，其一指向直接后继，另一指向直接前驱。

￼![doubly_linked_list](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/SinglyLinkedList/doubly_linked_list.png)

### 链表 VS 数组

链表相比数组，查询元素的复杂度为O(n)，慢于数组。但数组在初始化需要知道数据的大小，链表则可以充分利用内存空间，实现灵活的内存动态管理。虽然动态数组能够根据需求动态扩容，但扩充的空间可能是对内存的浪费。

### 单向链表及节点类

```
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
}
```

### 单向链表接口设计

```
/// 根据索引查找节点元素
/// - Parameter index: 节点元素索引
/// - Returns: 节点元素
public func element(at index: Int)-> Element
    
/// 添加节点
/// - Parameter value: 节点元素
public func append(_ value: Element)
    
/// 插入节点
/// - Parameters:
///   - value: 节点元素
///   - index: 节点索引
public func insert(_ value: Element, at index: Int)
     
/// 移除节点
/// - Parameter index: 节点索引
/// - Returns: 移除的元素值
@discardableResult
public func remove(at index: Int) -> Element
    
/// 移除头节点，空链表返回nil
/// - Returns: 头元素
@discardableResult
public func popHead() -> Element?
    
/// 移除头节点，链表不能为空链表
/// - Returns: 头元素
@discardableResult
public func removeHead() -> Element
    
/// 移除尾节点，空链表返回nil
/// - Returns: 尾元素
@discardableResult
public func popTail() -> Element?
    
/// 移除尾节点，链表不能为空链表
/// - Returns: 尾元素
@discardableResult
public func removeTail() -> Element
    
/// 移除所有节点
public func removeAll()
```

### 实现

```
	public func element(at index: Int)-> Element {
        node(at: index).value
    }
    
    public func append(_ value: Element) {
        append(Node(value: value))
    }
    
    public func insert(_ value: Element, at index: Int) {
        let newNode = Node(value: value)
        insert(newNode, at: index)
    }
    
    @discardableResult
    public func remove(at index: Int) -> Element {
        removeNode(after: index == 0 ? nil : node(at: index - 1))
    }
    
    @discardableResult
    public func popHead() -> Element? {
        isEmpty ? nil : removeHead()
    }
    
    @discardableResult
    public func removeHead() -> Element {
        remove(at: 0)
    }
    
    @discardableResult
    public func popTail() -> Element? {
        isEmpty ? nil : removeTail()
    }
    
    @discardableResult
    public func removeTail() -> Element {
        remove(at: _count - 1)
    }
    
    public func removeAll() {
        head = nil
        _count = 0
    }
    
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
```

### 数据打印

```
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
```

### 单向链表反转

```
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
}
```