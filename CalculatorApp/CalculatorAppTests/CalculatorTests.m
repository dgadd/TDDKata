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

-(void)testGivenAddMethod_whenNewLineInputSubmitted_thenShouldBeTreatedSameAsComma {
    NSInteger expected = 14;
    NSInteger result = [_sut add:@"4,5\n5"];

    STAssertEquals(expected, result, @"When new line delimiter is input, it should be treated the same as a comma.");
}

-(void)testGivenAddMethod_whenDuplicateDelimitersAreInput_thenAnExceptionShouldBeThrown {
    STAssertThrowsSpecificNamed([_sut add:@"3,,4,5"], NSException, @"DuplicateDelimitersException", @"Expected exception should be thrown.");
}

-(void)testGivenAddMethod_whenCustomDelimiterInputSubmitted_thenShouldBeTreatedSameAsComma {
    NSInteger expected = 14;
    NSInteger result = [_sut add:@"//$\n4,5$5"];

    STAssertEquals(expected, result, @"When custom delimiter delimiter is input, it should be treated the same as a comma.");
}

-(void)testGivenAddMethod_whenNegativeNumbersAreInput_thenAnExceptionShouldBeThrownWithListOfNumbers {
    @try {
        [_sut add:@"3,-5,-2"];
        STAssertFalse(true, @"When negative numbers are input, then an exception should be thrown.");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"NegativeNumbersException", [ex name], @"The expected exception name was not thrown.");
        STAssertEqualObjects(@"You cannot input negative numbers: -5,-2,", [ex description], @"The expected exception description was not thrown.");
    }
}

@end
