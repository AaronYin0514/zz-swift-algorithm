//
//  ZZArray.h
//  Array
//
//  Created by AaronYin on 2020/11/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZArray : NSObject

@property (nonatomic, assign, readonly) NSUInteger count;

- (instancetype)init;

- (instancetype)initWithCapacity:(NSUInteger)capacity;

- (void)addObject:(id)anObject;

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;

- (id)objectAtIndex:(NSUInteger)index;

- (void)removeObjectAtIndex:(NSUInteger)index;

- (void)removeAllObjects;

- (void)removeLastObject;

@end

NS_ASSUME_NONNULL_END
