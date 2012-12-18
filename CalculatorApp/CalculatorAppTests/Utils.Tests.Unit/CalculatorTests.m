#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests {
    Calculator *_sut;
}

- (void)setUp {
    [super setUp];
    _sut = [[Calculator alloc] init];
}

-(void)testGivenSut_whenIAddAZeroLengthString_thenNumeric0IsReturned {
    NSInteger expected = 0;
    NSInteger result = [_sut add:@""];

    STAssertEquals(expected, result, @"Zero length input should return 0.");
}

-(void)testGivenSut_whenIAddAOneLengthString_thenNumericEquivalentIsReturned {
    NSInteger expected = 9;
    NSInteger result = [_sut add:@"9"];

    STAssertEquals(expected, result, @"One length input should return numeric equivalent.");
}


@end
