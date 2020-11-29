# 树 & 二叉树 基本概念

## 树的基本概念

![binary tree](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinaryTree/binarytree.png)

### 树 & 结点 & 根结点 & 子树

**树**（Tree）是n（n>=0）个**结点**的有限集。

1. 有且仅有一个特定的称为根（Root）的结点；
2. 当n>1时，其余结点可分为m（m>0）个互不相交的有限集T1,T2,...,Tm，其中每一个集合本身又是一棵树，并且称为根的**子树（SubTree）**。

### 结点的度 & 树的度

树的**结点**包含一个数据元素及若干指向其子树的分支。结点拥有的子树数称为**结点的度（Degree）**。

**树的度**是树内各结点的度的最大值。

![binary tree](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinaryTree/tree.png)

### 叶子结点

度为0的结点称为**叶子（Leaf）**或**终端结点**。

度不为0的结点称为**非终端结点**或**分支结点**。

### 子结点 & 父结点 & 兄弟结点 & 祖先结点

结点的子树的根称为该结点的**子结点（Child）**。

该结点称为子结点的**父结点（Parent）**。

同一父结点的子结点之间互称**兄弟结点（Sibling）**。

结点的**祖先**是从根到该结点所经分支上的所有结点。

### 层次 & 高度

结点的**层次（Level）**从根开始定义起，根结点为第一层，根的子结点为第二层。若某结点在第l层，则其子树的根结点就在第l+1层。

树中结点的最大层次称为树的**深度（Depth）**或高度。

### 有序树 & 无序树 & 森林

如果将树中结点的各子树看成从左至右是有层序的（即不能互换），则称为该树为**有序树**，否则称为**无序树**。

**森林（Forest）**是m（m>=0）棵互不相交的树的集合。

## 二叉树基本概念

### 二叉树

**二叉树（Binary Tree）**是每个结点至多只有两棵子树，并且二叉树的子树有左子树、右子树之分，其次序不能任意颠倒。

### 二叉树的性质

> 性质1:在二叉树的第i层上至多有2^(i-1)个结点（i>=1）。


> 性质2:深度为k的二叉树至多有2^k-1个结点（k>=1）。

```
最多结点树n = 2^0 + 2^1 + ... + 2^(k - 1) = 2^k - 1
```

> 性质3:对任何一棵二叉树T，如果其叶子结点数为n0，度为2的结点数为n2，则n0=n2+1。

```
证明：
设n为树的总结点数，n1为结点为1的结点数，则：n=n0+n1+n2
设B为树的分支数，由于除根结点为每个结点对应一个分支，则：n=B+1
结点数为1的结点对应1条分支，结点数为2的结点对应2条分支，则：B=n1+2*n2
所以n=n1+2*n2+1
所以n0=n2+1
```

![binary tree](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinaryTree/complete_binary_tree.png)

## 满二叉树 & 完全二叉树

### 概念

**满二叉树**：一棵深度为k且有2^k-1个结点的二叉树称为满二叉树。

**完全二叉树**：深度为k的，有n个结点的二叉树，当且仅当每一个结点都与深度为k的满二叉树中编号从1至n的结点一一对应时，称之为完全二叉树。

### 完全二叉树的性质

> 性质1:具有n个结点的完全二叉树的深度为floor(log2(n)) + 1。(floor向下取整)

```
设深度为k，由二叉树的性质2可知，深度为k-1的二叉树至多有2^(k-1) - 1个结点。
所以：2^(k-1) - 1 < n
由定义可知：n <= 2^k - 1
所以有：2^(k-1) - 1 < n <= 2^k - 1，因为n是整数
所以有：2^(k-1) <= n < 2^k
所以有：k-1 <= log2(n) < k
所以：k = floor(log2(n)) + 1
```

> 性质2:如果对一棵有n个结点的完全二叉树的结点按层序编号（从第1层到第floor(log2(n)) + 1层，每层从左到右），则对任一结点i（1<=i<=n）,有：
>
> (1)如果i=1，则结点i是二叉树的根，无父结点；如果i>1，则其父结点PARENT（i）是结点floor(i/2)。
>
> (2)如果2*i>n，则结点i无左子树（结点i为叶子结点）；如果2*i<=n，其左子树LCHILD(i)是结点2*i。
>
> (3)如果2*i+1>n，则结点i无右子树；如果2*i+1<=n，其右子树RCHILD(i)是结点2*i+1。

## 遍历二叉树

### 遍历二叉树

即如何按某条路径巡访树中的每个结点，使得每个结点均被访问一次，而且仅被访问一次。

### 根据访问结点顺序不同，分为4种：

**1、前序遍历(Preorder Traversal)**

（1）访问根结点
（2）前序遍历左子树
（3）前序遍历右子树

![binary tree](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinaryTree/preorder.png)

**2、中序遍历（Inorder Traversal）**

（1）中序遍历左子树
（1）访问根结点
（2）中序遍历右子树

![binary tree](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinaryTree/inorder.png)

**3、后序遍历（Postorder Traversal）**

（1）后续遍历左子树
（2）后续遍历右子树
（3）访问根结点

![binary tree](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinaryTree/postorder.png)

**4、层序遍历（Level Order Traversal）**

从上到下、从左到右，依次访问每一个结点。

![binary tree](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BinaryTree/levelorder.png)

## 前驱结点(predecessor) & 后继结点(successor)

**前驱结点(predecessor)**：中序遍历时前一个结点

**后继结点(successor)**：中序遍历时后一个结点






