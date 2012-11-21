#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests {
    Calculator *_sut;
}

- (void)setUp {
    [super setUp];
    _sut = [[Calculator alloc] init];
}

-(void)testGivenAddMethod_whenAZeroLengthStringIsInput_thenNumericZeroIsReturned {
    NSInteger expected = 0;
    NSInteger result = [_sut add:@""];

    STAssertEquals(expected, result, @"When a zero length string is input, then numeric zero should be returned.");
}

-(void)testGivenAddMethod_whenAOneLengthStringIsInput_thenNumericEquivalentIsReturned {
    NSInteger expected = 9;
    NSInteger result = [_sut add:@"9"];

    STAssertEquals(expected, result, @"When a one length string is input, then numeric equivalent should be returned.");
}


@end
