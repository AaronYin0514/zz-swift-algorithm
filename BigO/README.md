## 复杂度

### 求第n个斐波那契数

> 斐波那契数列：由0和1开始，之后的斐波那契数就是由之前的两数相加而得出。
> 
> 首几个斐波那契数是：
> 
> 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233……
> 
> --《维基百科》

#### 题目

> 写一个函数，输入n，求斐波那契（Fibonacci）数列的第 n 项。
> 
> --《剑指Offer》

#### 解法1——递归

```
func fib1(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    return fib1(n - 1) + fib1(n - 2)
}
```

测试：

```
func testFib1() throws {
    XCTAssertEqual(5, fib1(5))
    XCTAssertEqual(21, fib1(8))
    XCTAssertEqual(89, fib1(11))
    XCTAssertEqual(233, fib1(13))
}
```

#### 解法2——循环

```
func fib2(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    var fibNMinTwo = 0
    var fibNMinOne = 1
    var fibN = 0
    for _ in 2...n {
        fibN = fibNMinTwo + fibNMinOne
        fibNMinTwo = fibNMinOne
        fibNMinOne = fibN
    }
    return fibN
}
```

测试:

```
func testFib2() throws {
    XCTAssertEqual(5, fib2(5))
    XCTAssertEqual(21, fib2(8))
    XCTAssertEqual(89, fib2(11))
    XCTAssertEqual(233, fib2(13))
}
```

### 如何度量一个算法的效率

> 1. 事后统计的方法
> 2. 事前分析的方法
> 
> ——《数据结构(C语言版)》

#### 计算函数耗时

```
func performanceMeasure(f: () -> Void) {
    let start = Date().timeIntervalSince1970
    f()
    let end = Date().timeIntervalSince1970
    print("函数耗时：\(end - start)s")
}
```

#### 事后统计-测试两个斐波那契数算法效率

```
performanceMeasure {
    _ = fib1(45)
}
        
performanceMeasure {
    _ = fib2(45)
}
```

结果：

> 函数耗时：23.239978075027466s
> 
> 函数耗时：0.0006780624389648438s

**分析**

从结果上看，递归方式耗时明显。如下图所示，递归调用有大量重复节点，意味着计算量会随着n的增大急剧增大。

![斐波那契数列-递归法](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BigO/pic001.jpg)

#### 事后统计-缺点

这种计算函数耗时的方法，在实际iOS开发工作中是比较有用的。比如在APP启动时间优化中，就会用这种方法，计算启动总耗时。

但是在算法科学中，这种方法有以下缺点：

1. 执行时间严重依赖硬件以及运行时各种不确定的环境因素
2. 必须编写相应的测试代码
3. 测试数据的选择比较难保证公正性

### 大O表示法（BigO）

> 算法的时间复杂度通常用大O符号表述，定义为T[n] = O(f(n))。它表示一个算法的渐进时间复杂度。f(n)表示代码执行次数之。n为数据规模。

这里容易让人糊涂的地方是，BigO表示的是随着数据规模n的增大，时间的变化趋势，并不是计算一个精确的时间。在BigO表示法中，会忽略常数、系数和低阶数值。请看下面的例子：

#### 复杂度为O(1)

```
func test1() {
    for _ in 0..<4 {
        print("test")
    }
}
```

函数执行了4次循环，但无论是4次还是400次，函数所消耗的时间都不会随着数据规模n的增长而增长。我们用O(1)表示它的复杂度。

#### 复杂度为O(n)

```
func test2(_ n: Int) {
    for _ in 0..<(2 * n) {
        print("test")
    }
}
```

函数执行了2n次，函数耗时随着n的变化而变化，所以它的复杂度用O(n)来表示。那2呢，我们可以想象成n趋紧无穷大时，常数和倍数就没有意义了。所以会被忽略掉。

#### 复杂度为O(n^2) 

> n的平方

```
func test3(_ n: Int) {
    for _ in 0..<n {
        for _ in 0..<n {
            print("test")
        }
    }
}
```

外层循环了n次，内存也循环了n次，那么代码执行了n * n次，所以我们用O(n^2)来表示它的复杂度。

#### 复杂度为O(log(n))

```
func test4(_ n: Int) {
    var m = n
    while m > 0 {
        m /= 2
        print("test")
    }
}
```

代码执行了log2(n)次，根据对数换底公式，它总能转换为任意底n的对数与一个常数的乘积，而系数是被忽略的，所以在写法上我们忽略底。它的复杂度用O(log(n))表示。

> 对数换底公式
>
> loga(b) = logc(b) / logc(a)

#### 复杂度为O(nlog(n))

```
func test5(_ n: Int) {
    var m = 1
    while m < n {
        m *= 2
        for _ in 0..<n {
            print("test")
        }
    }
}
```

外层循环了log2(n)次，内层循环了n次，所以它的复杂度是O(nlog(n))

#### 常用的时间复杂度数量级

![常用的时间复杂度数量级](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/BigO/pic002.png)

> O(1) < O(log(n)) < O(nlog(n)) < O(n^2) < O(n^3) < O(2^n) < O(n!) < O(n^n)

### 斐波那契数列复杂度分析

#### 递归方式

fib1是一个递归函数，每次调用会拆分为两个fib1函数，所以它的复杂度是O(2^n)

#### 循环方式

fib2函数内有一个for循环，所以它的复杂度是O(n)

### 空间复杂度

> 空间复杂度表述，随着数据规模的扩大，程序要分配的内存空间的增涨趋势。

#### 常用空间复杂度O(1)

```
func test11() {
    var i = 0
    var j = 0
    i += 1
    j += 1
}
```

#### 常用空间复杂度O(n)

```
func test12(_ n: Int) {
    var arr: [Int] = []
    for i in 0..<n {
        arr.append(i)
    }
}
```

