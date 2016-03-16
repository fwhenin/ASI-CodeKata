//
//  BinarySearchTests.m
//  BinarySearchTests
//
//  Created by Jordan Camara on 3/4/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FunctionalChop.h"

@interface BinarySearchTests : XCTestCase

@property (nonatomic, retain) FunctionalChop *functionalChop;

@end

@implementation BinarySearchTests

- (void)setUp {
    [super setUp];
    _functionalChop = [[FunctionalChop alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testRecursiveChop {
    NSInteger result = [_functionalChop karateChopForTarget:0 inList:@[]];
    XCTAssertEqual(-1, result);
    result = [_functionalChop karateChopForTarget:1 inList:@[@1]];
    XCTAssertEqual(0, result);
    result = [_functionalChop karateChopForTarget:3 inList:@[@1, @2]];
    XCTAssertEqual(-1, result);
    
    
    result = [_functionalChop karateChopForTarget:1 inList:@[@1, @3, @5]];
    XCTAssertEqual(0, result);
    result = [_functionalChop karateChopForTarget:3 inList:@[@1, @3, @5]];
    XCTAssertEqual(1, result);
    result = [_functionalChop karateChopForTarget:5 inList:@[@1, @3, @5]];
    XCTAssertEqual(2, result);
    result = [_functionalChop karateChopForTarget:2 inList:@[@1, @3, @5]];
    XCTAssertEqual(-1, result);
    result = [_functionalChop karateChopForTarget:4 inList:@[@1, @3, @5]];
    XCTAssertEqual(-1, result);
    result = [_functionalChop karateChopForTarget:6 inList:@[@1, @3, @5]];
    XCTAssertEqual(-1, result);
    
    result = [_functionalChop karateChopForTarget:1 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(0, result);
    
    result = [_functionalChop karateChopForTarget:3 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(1, result);
    
    result = [_functionalChop karateChopForTarget:5 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(2, result);
    
    result = [_functionalChop karateChopForTarget:7 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(3, result);
    
    result = [_functionalChop karateChopForTarget:0 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(-1, result);
    
    result = [_functionalChop karateChopForTarget:2 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(-1, result);
    
    result = [_functionalChop karateChopForTarget:4 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(-1, result);
    
    result = [_functionalChop karateChopForTarget:6 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(-1, result);
    
    result = [_functionalChop karateChopForTarget:8 inList:@[@1, @3, @5, @7]];
    XCTAssertEqual(-1, result);
}

@end
