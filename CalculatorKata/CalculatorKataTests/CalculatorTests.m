#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)testAddMethod_zeroLengthInput_shouldReturn0 {
    int expected = 0;
    int result = [sut add:@""];

    STAssertEquals(expected, result, @"Zero length input should return 0.");
}


@end
