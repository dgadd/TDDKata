//
//  TDDKataCalc.m
//  TDDKataCalc
//
//  Created by David Gadd on 12/03/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TDDKataCalc.h"
#import "Calculator.h"

@implementation TDDKataCalc

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
    STAssertEquals(expected, result, @"Zero length input should return zero");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    int result = [sut add:@"3"];
    int expected = 3;
    STAssertEquals(expected, result, @"One length input should return equivalent");
}

@end
