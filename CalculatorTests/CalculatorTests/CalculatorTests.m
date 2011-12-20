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
    CalcOperationType calcOperationType = Add;
    int result = [sut doOperation:calcOperationType onValue:@""];
    int expected = 0;

    STAssertEquals(expected, result, @"Zero length input returns zero.");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    CalcOperationType calcOperationType = Add;
    int result = [sut doOperation:calcOperationType onValue:@"5"];
    int expected = 5;

    STAssertEquals(expected, result, @"One length input returns equivalent.");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    CalcOperationType calcOperationType = Add;
    int result = [sut doOperation:calcOperationType onValue:@"5,3"];
    int expected = 8;

    STAssertEquals(expected, result, @"Two length input returns sum.");
}


- (void)dealloc {
    [super dealloc];
}


@end
