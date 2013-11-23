#import <XCTest/XCTest.h>
#import "Calculator.h"

@interface CalculatorKataTests : XCTestCase

@end

@implementation CalculatorKataTests

-(void)test_givenSut_whenZeroLengthStringInput_thenZeroReturned {
    NSInteger expected = 0;
    Calculator *sut = [[Calculator alloc] init];
    NSInteger result = [sut add:@""];

    XCTAssertEqual(expected, result);
}

-(void)test_givenSut_whenOneLengthStringInput_thenNumericEquivalentReturned {
    NSInteger expected = 3;
    Calculator *sut = [[Calculator alloc] init];
    NSInteger result = [sut add:@"3"];

    XCTAssertEqual(expected, result);
}

@end
