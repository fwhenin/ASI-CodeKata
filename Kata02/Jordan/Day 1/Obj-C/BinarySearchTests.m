//
//  BinarySearchTests.m
//  BinarySearchTests
//
//  Created by Jordan Camara on 3/4/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RecursiveChop.h"

@interface BinarySearchTests : XCTestCase

@property (nonatomic, retain) RecursiveChop *recursiveChop;

@end

@implementation BinarySearchTests

- (void)setUp {
    [super setUp];
    _recursiveChop = [[RecursiveChop alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testRecursiveChop {
    NSInteger result = [_recursiveChop karateChopForTarget:0 inList:@[]];
    XCTAssertEqual(-1, result);
    result = [_recursiveChop karateChopForTarget:1 inList:@[@1]];
    XCTAssertEqual(0, result);
    result = [_recursiveChop karateChopForTarget:3 inList:@[@1, @2]];
    XCTAssertEqual(-1, result);
    
    
    result = [_recursiveChop karateChopForTarget:1 inList:@[@1, @3, @5]];
    XCTAssertEqual(0, result);
    result = [_recursiveChop karateChopForTarget:3 inList:@[@1, @3, @5]];
    XCTAssertEqual(1, result);
    result = [_recursiveChop karateChopForTarget:5 inList:@[@1, @3, @5]];
    XCTAssertEqual(2, result);
    result = [_recursiveChop karateChopForTarget:2 inList:@[@1, @3, @5]];
    XCTAssertEqual(-1, result);
    result = [_recursiveChop karateChopForTarget:4 inList:@[@1, @3, @5]];
    XCTAssertEqual(-1, result);
    result = [_recursiveChop karateChopForTarget:6 inList:@[@1, @3, @5]];
    XCTAssertEqual(-1, result);
    
    result = [_recursiveChop karateChopForTarget:1 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(0, result);
    
    result = [_recursiveChop karateChopForTarget:3 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(1, result);
    
    result = [_recursiveChop karateChopForTarget:5 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(2, result);
    
    result = [_recursiveChop karateChopForTarget:7 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(3, result);
    
    result = [_recursiveChop karateChopForTarget:0 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(-1, result);
    
    result = [_recursiveChop karateChopForTarget:2 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(-1, result);
    
    result = [_recursiveChop karateChopForTarget:4 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(-1, result);
    
    result = [_recursiveChop karateChopForTarget:6 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(-1, result);
    
    result = [_recursiveChop karateChopForTarget:8 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(-1, result);
}

@end
