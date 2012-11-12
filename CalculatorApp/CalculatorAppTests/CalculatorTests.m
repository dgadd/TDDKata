#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)testGivenSut_whenZeroLengthInput_thenZeroShouldBeReturned {
    NSInteger expected = 0;
    NSInteger result = [sut add:@""];

    STAssertEquals(expected, result, @"Zero length input should return 0.");
}

- (void)testGivenSut_whenOneLengthInput_thenNumericEquivalentShouldBeReturned {
    NSInteger expected = 9;
    NSInteger result = [sut add:@"9"];

    STAssertEquals(expected, result, @"One length input should return numeric equivalent.");
}

- (void)testGivenSut_whenTwoLengthInput_thenSumShouldBeReturned {
    NSInteger expected = 9;
    NSInteger result = [sut add:@"4,5"];

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testGivenSut_whenAnyLengthInput_thenSumShouldBeReturned {
    NSInteger expected = 0;
    NSInteger randomAmount = arc4random() % 999;
    NSMutableString *numbersToAdd = [NSMutableString string];
    for (NSInteger i = 0; i < randomAmount; i++) {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        expected += i;
    }
    NSInteger result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testGivenSut_whenNewLineInput_thenSumShouldBeReturned {
    NSInteger expected = 12;
    NSInteger result = [sut add:@"4,5\n3"];

    STAssertEquals(expected, result, @"New line input should return sum.");
}

-(void)testGivenSut_whenDuplicateDelimiterInput_thenExceptionShouldBeThrown {
    STAssertThrowsSpecificNamed([sut add:@"3,4\n,5"], NSException, @"DuplicateDelimitersException", @"The expected exception was not thrown");
}




@end
