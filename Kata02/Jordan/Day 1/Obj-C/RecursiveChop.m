//
//  BinarySearch.m
//  BinarySearch
//
//  Created by Jordan Camara on 3/4/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

#import "RecursiveChop.h"

@interface RecursiveChop()

- (NSInteger)recursiveChopForTarget:(NSInteger)target inList:(NSArray *)list withStartIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex;

@end

@implementation RecursiveChop

- (NSInteger)karateChopForTarget:(NSInteger)target inList:(NSArray *)list
{
    return [self recursiveChopForTarget:target inList:list withStartIndex:0 endIndex:list.count - 1];
}

- (NSInteger)recursiveChopForTarget:(NSInteger)target inList:(NSArray *)list withStartIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    if (startIndex > endIndex) {
        return -1;
    }
    
    NSInteger centerIndex = (startIndex + endIndex) / 2;
    
    NSInteger value = [(NSNumber *)[list objectAtIndex:centerIndex] integerValue];
    if (target < value) {
        return [self recursiveChopForTarget:target inList:list withStartIndex:startIndex endIndex:centerIndex - 1];
    }
    else if (target > value) {
        return [self recursiveChopForTarget:target inList:list withStartIndex:centerIndex + 1 endIndex:endIndex];
    }
    else {
        return centerIndex;
    }
}

@end
