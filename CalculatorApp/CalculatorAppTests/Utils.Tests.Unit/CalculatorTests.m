#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests {
    Calculator *_sut;
}

- (void)setUp {
    [super setUp];
    _sut = [[Calculator alloc] init];
}

-(void)testGivenAddMethod_whenInputZeroLengthString_thenNumericZeroIsReturned {
    NSInteger expected = 0;
    NSInteger result = [_sut add:@""];

    STAssertEquals(expected, result, @"When zero length string is input, then 0 should be returned.");
}


@end
