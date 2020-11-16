//
//  ZZArray.h
//  Array
//
//  Created by AaronYin on 2020/11/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

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

NS_ASSUME_NONNULL_END
