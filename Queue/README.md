## 队列（queue）

### 队列

> **队列**（queue）是一种先进先出（first in first out，缩写**FIFO**）的线性表。
>
> 它只允许在表的一端进行插入，而在另一端删除元素。

![queue](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/Queue/queue.png)

```
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
```

### 双端队列(deque)

> **双端队列**是限定插入和删除操作在表的两端进行的线性表。

![deque](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/Queue/deque.png)

```
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
```