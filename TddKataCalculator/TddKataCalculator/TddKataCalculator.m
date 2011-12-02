//
//  TddKataCalculator.m
//  TddKataCalculator
//
//  Created by David Gadd on 12/01/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TddKataCalculator.h"

@implementation TddKataCalculator

- (void)setUp
{
    [super setUp];
    calc = [[Calculator alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testAddMethod_ZeroLengthInput_ReturnsZero {
    int result = [calc add:@""];
    int expected = 0;
    STAssertEquals(expected, result, @"Zero-length input returns zero.");
}

@end
