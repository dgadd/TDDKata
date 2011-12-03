//
//  TDDKataCalc.m
//  TDDKataCalc
//
//  Created by David Gadd on 12/03/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TDDKataCalc.h"

@implementation TDDKataCalc

- (void)setUp
{
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testAddMethod_ZeroLengthInput_ReturnsZero
{
    int result = [sut add:@""];
    int expected = 0;
    STAssertEquals(expected, result, @"zero-length input should return 0");
}

@end
