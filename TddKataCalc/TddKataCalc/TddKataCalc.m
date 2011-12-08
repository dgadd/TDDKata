//
//  TddKataCalc.m
//  TddKataCalc
//
//  Created by David Gadd on 12/07/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TddKataCalc.h"
#import "Calculator.h"

@implementation TddKataCalc


- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];
}


- (void)tearDown {
    [sut release];
    [super tearDown];
}

- (void)testAddMethod_ZeroLengthInput_ReturnsZero {
    int result = [sut add:@""];
    int expected = 0;
    STAssertEqualObjects(expected, result, "Zero length input should return 0");
}

@end
