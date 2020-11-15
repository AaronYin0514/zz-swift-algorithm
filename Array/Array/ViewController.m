//
//  ViewController.m
//  Array
//
//  Created by AaronYin on 2020/11/15.
//

#import "ViewController.h"
#import "ZZArray.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSUInteger i = 0;
//    NSLog(@"%lu", i++);
//    NSLog(@"%lu", i);
//    NSLog(@"%lu", ++i);
//    NSLog(@"%lu", i);
    
    ZZArray *array = [[ZZArray alloc] init];
    
    [array addObject:@"zzz"];
    
    for (NSInteger i = 1; i < 11; i++) {
        [array addObject:[NSString stringWithFormat:@"%ld", i]];
    }
    
    [array removeObjectAtIndex:4];
//    [array removeAllObjects];
    [array removeLastObject];
    
    [array insertObject:@"999" atIndex:8];
    
    NSLog(@"%@", array);
    
    [array release];
    
}


@end
