//
//  IterativeChop.m
//  BinarySearch
//
//  Created by Jordan Camara on 3/4/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

#import "IterativeChop.h"

@implementation IterativeChop

- (NSInteger)karateChopForTarget:(NSInteger)target inList:(NSArray *) list
{
    NSInteger startIndex = 0;
    NSInteger endIndex = list.count -1;
    
    while (startIndex <= endIndex) {
        NSInteger centerIndex = (startIndex + endIndex) / 2;
        
        NSInteger value = [(NSNumber *)[list objectAtIndex:centerIndex] integerValue];
        if (target < value) {
            endIndex = centerIndex - 1;
        }
        else if (target > value) {
            startIndex = centerIndex + 1;
        }
        else {
            return centerIndex;
        }
    }
    
    return -1;
}

@end
