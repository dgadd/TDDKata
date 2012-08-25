#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)testAddMethod_zeroLengthInput_returnsZero {
    NSInteger expected = 0;
    NSInteger result = [sut add:@""];

    STAssertEquals(expected, result, @"Zero length input returns zero.");
}

- (void)testAddMethod_oneLengthInput_returnsEquivalent {
    NSInteger expected = 3;
    NSInteger result = [sut add:@"3"];

    STAssertEquals(expected, result, @"One length input returns equivalent.");
}

- (void)testAddMethod_twoLengthInput_returnsSum {
    NSInteger expected = 12;
    NSInteger result = [sut add:@"5,7"];

    STAssertEquals(expected, result, @"Two length input returns sum.");
}

@end
