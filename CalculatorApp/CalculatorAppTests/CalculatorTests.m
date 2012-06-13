#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)testAddMethod_zeroLengthInput_returns0 {
    int expected = 0;

    int result = [sut add:@""];
    STAssertEquals(expected, result, @"0-length input should return 0.");
}

- (void)testAddMethod_oneLengthInput_returnsEquivalent {
    int expected = 3;

    int result = [sut add:@"3"];
    STAssertEquals(expected, result, @"1-length input should return equivalent.");
}

@end
