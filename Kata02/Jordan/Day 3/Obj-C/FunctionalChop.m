//
//  FunctionalChop.m
//  BinarySearch
//
//  Created by Jordan Camara on 3/4/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

#import "FunctionalChop.h"

@implementation FunctionalChop

- (NSInteger)karateChopForTarget:(NSInteger)target inList:(NSArray *) list
{
    NSInteger (^vorpalSlicer) (NSInteger, NSInteger);
    __weak __block NSInteger (^weakVorpalSlicer) (NSInteger, NSInteger);
    
    weakVorpalSlicer = vorpalSlicer = ^NSInteger (NSInteger startIndex, NSInteger endIndex) {
        if (startIndex > endIndex) {
            return -1;
        }
        
        NSInteger centerIndex = (endIndex + startIndex) / 2;
        
        NSInteger value = [(NSNumber *)[list objectAtIndex:centerIndex] integerValue];
        
        if (target < value) {
            return weakVorpalSlicer(startIndex, centerIndex - 1);
        }
        else if (target > value) {
            return weakVorpalSlicer(centerIndex + 1, endIndex);
        }
        else {
            return centerIndex;
        }
    };
    
    return vorpalSlicer(0, list.count - 1);
}

@end
