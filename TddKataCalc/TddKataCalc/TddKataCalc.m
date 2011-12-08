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
    STAssertEquals(expected, result, @"Zero length input should return 0");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    int result = [sut add:@"3"];
    int expected = 3;
    STAssertEquals(expected, result, @"One length input should return equivalent");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    int result = [sut add:@"3,5"];
    int expected = 8;
    STAssertEquals(expected, result, @"Two length input should return sum");
}

- (void)testAddMethod_AnyLengthInput_ReturnsSum {
    int howMany = arc4random() % 999;
    NSMutableString *numbersToAdd = [NSMutableString string];
    int expected = 0;

    for(int i = 0; i < howMany; i++)
    {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        expected += i;
    }

    int result = [sut add:numbersToAdd];
    STAssertEquals(expected, result, @"Two length input should return sum");
}

- (void)testAddMethod_NewLineDelimiterInput_ReturnsSum {
    int result = [sut add:@"3,5\n8"];
    int expected = 16;
    STAssertEquals(expected, result, @"Two length input should return sum");
}


@end
