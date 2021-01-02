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

如下图：

![](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinarySearchTree/imgs/append.gif)

## 删除结点 

### 1 删除 - 叶子结点

如果要删除的结点是叶子结点，那么直接删除。如下图：

![](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinarySearchTree/imgs/delete_leaf.gif)

### 2 删除 - 度为1的结点

用子结点替代原结点的位置。如下图：

![](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinarySearchTree/imgs/delete_1.gif)

### 3 删除 - 度为2的结点

先用前驱或者后继结点的值覆盖原结点的值，然后删除相应的前驱或者后继结点。如下图：

> 如果一个结点的度为2，那么它的前驱、后继结点的度只可能是1和0

![](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinarySearchTree/imgs/delete_2.gif)

## 使用Swift Class实现二叉搜索树

[实现>>](https://github.com/AaronYin0514/zz-swift-algorithm/blob/main/BinarySearchTree/Solution1)

## 使用Swift Enum实现二叉搜索树

[实现>>](https://github.com/AaronYin0514/zz-swift-algorithm/blob/main/BinarySearchTree/Solution2)

## 二叉搜索树复杂度分析

如果按照从小到大的顺序添加结点，二叉搜索树就退化成链表。

![](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinarySearchTree/imgs/link.png)

## 平衡(Balance)

**平衡**：当结点数量固定时，左右子树的高度越接近，这棵二叉树就越平衡（高度越低）。最理想的平衡，就是像完全二叉树、满二叉树那样，高度是最小的。

![](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinarySearchTree/imgs/Tree.png)

## 如何改进二叉搜索树

首先，结点的添加、删除顺序是无法限制的，可以认为是随机的

所以，改进方案是：在结点的添加、删除操作之后，想办法让二叉搜索树恢复平衡（减少树的高度）

如果接着继续调整结点的位置，完全可以达到理想的平衡，但是付出的代价可能比较大

![](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinarySearchTree/imgs/balance.png)

如果调整的次数会比较多，反而增加了时间复杂度

总结来说，比较合理的改进方案是：用尽量少的调整次数达到适度平衡即可

一棵达到适度平衡的二叉搜索树，可以称之为：平衡二叉树

## 平衡二叉树（Balanced Binary Search Tree）

英文简称为：BBST

经典常见的平衡二叉搜索树有

### AVL树

* Windows NT内核中广泛使用

### 红黑树

* C++ STL （比如map、set）
* Java的TreeMap、TreeSet、HashMap、HashSet
* Linux的进度调度
* Ngix的timer管理

一般也称为它们为：自平衡的二叉搜索树（Self-balancing Binary Search Tree）




