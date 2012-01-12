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

    STAssertEquals(expected, result, @"Zero length input should return zero");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    int result = [sut add:@"4"];
    int expected = 4;

    STAssertEquals(expected, result, @"One length input should return equivalent");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    int result = [sut add:@"4,3"];
    int expected = 7;

    STAssertEquals(expected, result, @"Two length input should return sum");
}


- (void)dealloc {
    [super dealloc];
}


@end
