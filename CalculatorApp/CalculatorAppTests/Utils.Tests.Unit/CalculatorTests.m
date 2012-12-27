#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests {
    Calculator *_sut;
}

- (void)setUp {
    [super setUp];
    _sut = [[Calculator alloc] init];
}


-(void)testGivenIWantToAdd_whenZeroLengthInputIsPassedIn_thenNumericZeroShouldBeReturned {
    NSInteger expected = 0;
    NSInteger result = [_sut add:@""];

    STAssertEquals(expected, result, @"Zero length input should return 0.");
}
@end
