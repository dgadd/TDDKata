#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

- (void)setUp {
    sut = [[Calculator alloc] init];
    [super setUp];
}

- (void)tearDown {
    [sut release];
    [super tearDown];
}

- (void)testAddMethod_ZeroLengthInput_ReturnsZero {
    int result = [sut add:@""];
    int expected = 0;

    STAssertEquals(expected, result, @"Zero length input should return zero.");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    int result = [sut add:@"5"];
    int expected = 5;

    STAssertEquals(expected, result, @"One length input should return equivalent.");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    int result = [sut add:@"5,4"];
    int expected = 9;

    STAssertEquals(expected, result, @"Two length input should return sum.");
}


- (void)dealloc {
    [super dealloc];
}


@end
