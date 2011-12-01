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
    STAssertEquals(0, [calc add:@""], @"Empty string shoudl return zero");
}

@end
