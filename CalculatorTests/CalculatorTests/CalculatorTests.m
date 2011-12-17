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

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    int result = [sut add:@"9"];
    int expected = 9;

    STAssertEquals(expected, result, @"Zero-length input returns 0.");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    int result = [sut add:@"9,3"];
    int expected = 12;

    STAssertEquals(expected, result, @"Zero-length input returns 0.");
}


- (void)dealloc {
    [super dealloc];
}


@end
