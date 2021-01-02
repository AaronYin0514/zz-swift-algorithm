# AVL树

AVL树是最早发明的自平衡二叉搜索树之一，AVL取名于两位发明者的名字，G.M.Adelson-Velsky 和 E.M.Landis（来自苏联的科学家）

## AVL树的特点

**平衡因子（Balance Factor）**：某结点的左右子树的高度差。

1. 每个结点的平衡因子可能是1、0、-1（绝对值<=1，如果超过1，称之为“失衡”）
2. 每个结点的左右子树高度差不超过1
3. 搜索、添加、删除的时间复杂度是O(logn)

![](/Users/yinzhongzheng/Documents/Work/zz-swift-algorithm/AVLTree/bst_vs_avl.png)

## 添加导致的失衡

示例：往下面这棵树中添加13

最坏情况：可能会导致所有祖先结点都失衡

> 父结点、非祖先结点，都不能失衡

![](/Users/yinzhongzheng/Documents/Work/zz-swift-algorithm/AVLTree/cha.png)

### LL - 右旋转（单旋）

![](/Users/yinzhongzheng/Documents/Work/zz-swift-algorithm/AVLTree/add_ll.gif)

### RR - 左旋转（单旋）

![](/Users/yinzhongzheng/Documents/Work/zz-swift-algorithm/AVLTree/add_rr.gif)

### LR - RR左旋转，LL右旋转（双旋）

![](/Users/yinzhongzheng/Documents/Work/zz-swift-algorithm/AVLTree/add_lr.gif)

### RL - LL右旋转，RR左旋转（双旋）

![](/Users/yinzhongzheng/Documents/Work/zz-swift-algorithm/AVLTree/add_rl.gif)

## 删除导致的失衡

示例：删除子树中的16

> 可能会导致父结点或祖先结点失衡（只有1个结点会失衡），其他结点，都不失衡。

### LL - 右旋转（单旋）

![](/Users/yinzhongzheng/Documents/Work/zz-swift-algorithm/AVLTree/delete_rl.gif)

### RR - 左旋转（单旋）

![](/Users/yinzhongzheng/Documents/Work/zz-swift-algorithm/AVLTree/delete_rr.gif)

### LR - RR左旋转，LL右旋转（双旋）

![](/Users/yinzhongzheng/Documents/Work/zz-swift-algorithm/AVLTree/delete_lr.gif)

### RL - LL右旋转，RR左旋转（双旋）

![](/Users/yinzhongzheng/Documents/Work/zz-swift-algorithm/AVLTree/delete_rl.gif)

## 总结

### 添加

可能会导致所有祖先结点都失衡

只要让高度最低的失衡结点恢复平衡，整棵树就恢复平衡【仅需O(1)次调整】

### 删除

可能会导致父结点或祖先结点失衡（只有1个结点会失衡）

恢复平衡后，可能会导致更高层的祖先结点失衡【最多需要O(logn)次调整】

### 平均时间复杂度

* 搜索：O(logn)
* 添加：O(logn)，仅需O(1)次的旋转操作
* 删除：O(logn)，最多需要O(logn)次的旋转操作

