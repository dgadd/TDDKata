#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

- (void)setUp {
    [super setUp];
}

- (void)testAddMethod_zeroLengthInput_returnsZero {
    NSInteger expected = 0;
    NSInteger result = [sut add:@","];

    STAssertEquals(expected, result, @"Zero length input should return 0.");
}


@end
