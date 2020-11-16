//
//  ZZArray.m
//  Array
//
//  Created by AaronYin on 2020/11/15.
//

#import "ZZArray.h"

/// 最小数组容量
static NSInteger const ZZArrayMinCapacity = 10;

@interface ZZArray ()
{
    id *_contents_array; /// 数组指针
    NSUInteger _capacity; /// 数组容量
}

@end

@implementation ZZArray

#pragma mark - 初始化

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

#pragma mark - 查找

- (id)objectAtIndex:(NSUInteger)index {
    NSAssert(index >= 0 && index < _count, @"数组越界");
    return _contents_array[index];
}

#pragma mark - 添加

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

#pragma mark - 移除

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

#pragma mark - Print

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

@end
