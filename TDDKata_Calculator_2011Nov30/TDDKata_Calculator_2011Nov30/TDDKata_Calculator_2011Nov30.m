//
//  TDDKata_Calculator_2011Nov30.m
//  TDDKata_Calculator_2011Nov30
//
//  Created by David Gadd on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TDDKata_Calculator_2011Nov30.h"

@implementation TDDKata_Calculator_2011Nov30

- (void)setUp
{
    [super setUp];
    calc = [[Calculator alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testAddMethod_ZeroLengthInput_ReturnsZero
{
    int result = [calc add:@""];
    int expected = 0;
    STAssertEquals(expected, result, @"Zero-length input should return zero");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent
{
    int result = [calc add:@"3"];
    int expected = 3;
    STAssertEquals(expected, result, @"Single-length input should return equivalent");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum
{
    int result = [calc add:@"3,5"];
    int expected = 8;
    STAssertEquals(expected, result, @"Two-length input should return sum");
}

- (void)testAddMethod_AnyLengthInput_ReturnsSum
{
    int howMany = arc4random() % 999;
    NSMutableString* numbersToAdd = [NSMutableString string];
    int expected = 0;

    for(int i = 0; i < howMany; i++)
    {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        expected += i;
    }

    int result = [calc add:numbersToAdd];
    STAssertEquals(expected, result, @"Comma-seperated input should return sum.");
}

@end
