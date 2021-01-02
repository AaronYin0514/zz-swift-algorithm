# 二叉搜索树

## 思考

> 在n个动态的整数中搜索某个整数？

假设使用动态数组存放元素，从第0个位置开始遍历搜索，平均时间复杂度：O(n)

|  0  | 1  |  2  | 3  |  4  | 5 |  6  | 7  |  8  |  9  | 
|  ----  | ----  |  ----  | ----  |  ----  | ----  |  ----  | ----  |  ----  | ----  |
| 31  | 66 | 17  | 15 | 28  | 20 | 59  | 88 | 45  | 56 |

如果维护一个有序的动态数组，使用**二分搜索**，最坏的时间复杂度：**O(logn)**

但是**添加**、**删除**的平均时间复杂度是**O(n)**

|  0  | 1  |  2  | 3  |  4  | 5 |  6  | 7  |  8  |  9  | 
|  ----  | ----  |  ----  | ----  |  ----  | ----  |  ----  | ----  |  ----  | ----  |
| 15  | 17 | 20  | 28 | 31  | 45 | 56 | 59 | 66  | 88 |

针对这个需求，有没有更好的方案？使用**二叉搜索树**，添加、删除、搜索的最坏时间复杂度均可优化至：**O(logn)**

## 二叉搜索树（Binary Search Tree）

**二叉搜索树**是二叉树的一种，是应用非常广泛的一种二叉树(英文简称BST)，又被称为：二叉查找树、二叉排序树，二叉搜索树可以大大提高搜索数据的效率。

1. 任意一个结点的值都大于其左子树所有结点的值
1. 任意一个结点的值都小于其右子树所有结点的值
1. 它的左右子树也是一个二叉搜索树

二叉搜索树存储的元素必须具备可比较性，比如int、double等。如果是自定义类型，需要制定比较方式。

![](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinarySearchTree/imgs/Binary_Search_Tree.png)

## 二叉搜索树的接口设计

```
/// 元素数量
var count: Int { get }
/// 树高度
var height: Int { get }
/// 是否为空
var isEmpty: Bool { get }
// 添加元素
public func append(_ element: Element)
// 是否包含某元素
public func contains(_ element: Element) -> Bool
// 清空所有元素
public mutating func removeAll()
// 删除元素
public mutating func remove(_ element: Element)
/// 前序遍历
public func traversePreOrder(process: (Element) -> Void)
/// 中序遍历
public func traverseInOrder(process: (Element) -> Void)
/// 后序遍历
public func traversePostOrder(process: (Element) -> Void)
/// 层序遍历
public func traverseLevelOrder(process: (Element) -> Void)
```

## 添加结点

![](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinarySearchTree/imgs/append.gif)

## 删除结点 

### 1 删除 - 叶子结点

如果要删除的结点是叶子结点，那么直接删除。

![](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinarySearchTree/imgs/delete_leaf.gif)

### 2 删除 - 度为1的结点

用子结点替代原结点的位置

![](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinarySearchTree/imgs/delete_1.gif)

### 3 删除 - 度为2的结点

先用前驱或者后继结点的值覆盖原结点的值，然后删除相应的前驱或者后继结点

> 如果一个结点的度为2，那么它的前驱、后继结点的度只可能是1和0

![](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinarySearchTree/imgs/delete_2.gif)

## 使用Swift Class实现二叉搜索树

[实现>>](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinarySearchTree/Solution1)

## 使用Swift Enum实现二叉搜索树

[实现>>](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinarySearchTree/Solution2)

