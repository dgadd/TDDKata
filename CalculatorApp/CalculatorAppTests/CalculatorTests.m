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

-(void)testGivenAddMethod_whenTwoNumberCommaDelimitedInputSubmitted_thenSumShouldBeReturned {
    NSInteger expected = 9;
    NSInteger result = [_sut add:@"4,5"];

    STAssertEquals(expected, result, @"When two number comma-delimited is input, then sum should be returned.");
}

-(void)testGivenAddMethod_whenAnyLengthCommaDelimitedInputSubmitted_thenSumShouldBeReturned {
    NSInteger expected = 0;
    NSInteger randomAmount = arc4random() % 999;
    NSMutableString *numbersToAdd = [NSMutableString string];
    for (NSInteger i = 0; i < randomAmount; i++) {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        expected += i;
    }
    NSInteger result = [_sut add:numbersToAdd];

    STAssertEquals(expected, result, @"When any length comma-delimited is input, then sum should be returned.");
}


@end
