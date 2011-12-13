//
//  CalculatorTests.m
//  CalculatorTests
//
//  Created by David Gadd on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

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

    STAssertEquals(expected, result, @"Zero-length input returns 0.");
}

- (void)dealloc {
    [super dealloc];
}


@end
