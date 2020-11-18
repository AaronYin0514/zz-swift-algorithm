## 栈（stack）

### 栈和队列

> 从数据结构角度看，栈和队列也是线性表，其特殊性在于栈和队列的基本操作是线性表操作的子集，它们是操作受限的线性表，因此，可称为限定性的数据结构。

### 栈

> **栈（stack）**是限定仅在表尾进行插入或删除操作的线性表。
>
> 因此，对栈来说，表尾端有其特殊含义，称为**栈顶（top）**，相应的，表头端称为**栈底（bottom）**。
> 
> 不含元素的空表称为空栈。

### 栈的特点

> 假设栈S = (a1, a2,…, an)，则称a1为栈底元素，an为栈顶元素。栈中元素按a1，a2，…，an的次序进栈，出栈的第一个元素应为栈顶元素。换句话说，栈的修改是按后进先出的原则进行的。因此，栈又称为**后进先出**（last in first out）的线性表（简称**LIFO**结构）。

![stack](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/Stack/stack.png)

### 数组实现栈

```
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
```

### 有效的括号

> 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串数组，判断是否有效。
> 
> 有效需满足：

> 1. 左括号必须用相同类型的右括号闭合。
> 2. 左括号必须以正确的顺序闭合。
> 注意空字符串可被认为是有效字符串。

```
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
```

