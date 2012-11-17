#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests {
    Calculator *_sut;
}

- (void)setUp {
    [super setUp];
    _sut = [[Calculator alloc] init];
}

-(void)testGivenAddMethod_whenZeroLengthInputSubmitted_thenZeroShouldBeReturned {
    NSInteger expected = 0;
    NSInteger result = [_sut add:@""];

    STAssertEquals(expected, result, @"When zero length input, then 0 should be returned.");
}

-(void)testGivenAddMethod_whenOneLengthInputSubmitted_thenNumericEquivalentShouldBeReturned {
    NSInteger expected = 9;
    NSInteger result = [_sut add:@"9"];

    STAssertEquals(expected, result, @"When one length input, then numeric equivalent should be returned.");
}


@end
