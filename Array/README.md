## Objective-C实现动态数组

### 数据结构分类

数据元素之间关系的不同特性，通常有4类基本数据结构：

1. **集合**：结构中的数据元素之间除了“同属于一个集合”的关系外，别无其它关系；
2. **线性结构**：结构中的数据元素之间存在一个对一个的关系；
3. **树形结构**：结构中的数据元素之间存在一个对多个的关系；
4. **图状结构或网状结构**：结构中的数据元素之间存在多个对多个的关系；

![数据结构分类](https://raw.githubusercontent.com/AaronYin0514/zz-swift-algorithm/main/Array/pic001.png)

### 计算机存储结构类型

1. 顺序存储结构；
2. 链式存储结构。

### 线性表特征

1. 存在唯一的一个被称做"第一个"的数据元素；
2. 存在唯一的一个被称为"最后一个"的数据元素；
3. 除第一个之外，集合中的每个数据元素均只有一个前驱；
4. 除最后一个之外，集合中每个数据元素均只有一个后继。

### 线性表——数组

> 数组是一种顺序存储的线性表，所有元素的内存地址是连续的。

数组在初始化时需要指定容量，所以数组元素满了以后就需要扩容。我们利用Objective-C实现一个动态数组，来模拟这种情况。

### Objective-C动态数组

#### 接口设计

```
@interface ZZArray : NSObject

/// 数组元素个数
@property (nonatomic, assign, readonly) NSUInteger count;

/// 初始化，默认容量10
- (instancetype)init;

/// 初始化
/// @param capacity 指定数组初始容量，最小容量10
- (instancetype)initWithCapacity:(NSUInteger)capacity;

/// 添加数据元素
/// @param anObject 数据元素不能为nil
- (void)addObject:(id)anObject;

/// 插入数据元素
/// @param anObject 数据元素不能为nil
/// @param index 数组元素的位置
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;

/// 查找数据元素
/// @param index 数组元素的位置
- (id)objectAtIndex:(NSUInteger)index;

/// 移除数据元素
/// @param index 数组元素的位置
- (void)removeObjectAtIndex:(NSUInteger)index;

/// 移除所有数据元素，保留数组容量
- (void)removeAllObjects;

/// 移除最后一个数据元素
- (void)removeLastObject;

@end
```

#### 成员变量

```
/// 最小数组容量
static NSInteger const ZZArrayMinCapacity = 10;

@interface ZZArray ()
{
    id *_contents_array; /// 数组指针
    NSUInteger _capacity; /// 数组容量
}

@end
```

#### 初始化

```
- (instancetype)init {
    return [self initWithCapacity:ZZArrayMinCapacity];
}

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    if (self = [super init]) {
        if (capacity <= 0) {
            capacity = ZZArrayMinCapacity;
        }
        _capacity = capacity;
        _contents_array = NSZoneMalloc([self zone], sizeof(id) * capacity);
    }
    return self;
}

- (void)dealloc {
    if (_contents_array) {
        for (NSInteger i = 0; i < _count; i++) {
            [_contents_array[i] release];
        }
        NSZoneFree([self zone], _contents_array);
        _contents_array = 0;
    }
    [super dealloc];
}
```

#### 添加元素

```
- (void)addObject:(id)anObject {
    NSParameterAssert(anObject);
    [self ensureCapacity];
    _contents_array[_count] = [anObject retain];
    _count++;
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    NSParameterAssert(anObject);
    NSAssert(index >= 0 && index <= _count, @"数组越界");
    [self ensureCapacity];
    memmove(&_contents_array[index + 1], &_contents_array[index], (_count - index) * sizeof(id));
    _contents_array[index] = nil;
    _count++;
    _contents_array[index] = [anObject retain];
}

- (void)ensureCapacity {
    if (_count >= _capacity) {
    	 /// 数组扩容1.5倍
        NSUInteger newCapacity = _capacity + (_capacity >> 1);
        id *ptr = NSZoneRealloc([self zone], _contents_array, newCapacity * sizeof(id));
        NSAssert(ptr != 0, @"扩容失败");
        _contents_array = ptr;
        _capacity = newCapacity;
    }
}
```

#### 移除元素

```
- (void)removeObjectAtIndex:(NSUInteger)index {
    NSAssert(index >= 0 && index < _count, @"数组越界");
    if (index == _count - 1) {
        [self removeLastObject];
        return;
    }
    id obj = _contents_array[index];
    _contents_array[index] = 0;
    _count--;
    memmove(&_contents_array[index], &_contents_array[index + 1], (_count - index) * sizeof(id));
//    while (index < _count) {
//        _contents_array[index] = _contents_array[index + 1];
//        index++;
//    }
    _contents_array[_count] = 0;
    [obj release];
}

- (void)removeAllObjects {
    NSUInteger pos = _count;
    if (pos <= 0) {
        return;
    }
    _count = 0;
    while (pos-- > 0) {
        id obj = _contents_array[pos];
        _contents_array[pos] = 0;
        [obj release];
    }
}

- (void)removeLastObject {
    NSAssert(_count > 0, @"数组越界");
    _count--;
    id obj = _contents_array[_count];
    _contents_array[_count] = 0;
    [obj release];
}
```

#### 查询

```
- (id)objectAtIndex:(NSUInteger)index {
    NSAssert(index >= 0 && index < _count, @"数组越界");
    return _contents_array[index];
}
```

#### Debug打印

```
- (NSString *)description {
    NSMutableString *str = [[[NSMutableString alloc] initWithString:@"\n["] autorelease];
    for (NSInteger i = 0; i < _count; i++) {
        if (i != 0) {
            [str appendString:@","];
        }
        NSObject *obj = [self objectAtIndex:i];
        [str appendFormat:@"%@", obj];
    }
    [str appendString:@"]"];
    [str appendFormat:@"\ncount = %lu", _count];
    [str appendFormat:@"\ncapacity = %lu", _capacity];
    return str;
}
```


