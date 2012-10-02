#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)testAddMethod_zeroLengthInput_shouldReturnZero {
    NSInteger expected = 0;
    NSInteger result = [sut add:@""];

    STAssertEquals(expected, result, @"Zero length input should return 0.");
}

- (void)testAddMethod_oneLengthInput_shouldReturnEquivalent {
    NSInteger expected = 3;
    NSInteger result = [sut add:@"3"];

    STAssertEquals(expected, result, @"One length input should return numeric equivalent.");
}

- (void)testAddMethod_twoLengthInput_shouldReturnSum {
    NSInteger expected = 9;
    NSInteger result = [sut add:@"4,5"];

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_anyLengthInput_shouldReturnSum {
    NSInteger randomAmount = arc4random() % 999;
    NSInteger expected = 0;
    NSMutableString *numbersToAdd = [NSMutableString string];
    for (NSInteger i = 0; i < randomAmount; i++) {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        expected += i;
    }
    NSInteger result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Any length input should return sum.");
}

- (void)testAddMethod_newLineDelimiterInput_shouldReturnSum {
    NSInteger expected = 12;
    NSInteger result = [sut add:@"3\n4,5"];

    STAssertEquals(expected, result, @"New line delimiter input should return sum.");
}

- (void)testAddMethod_duplicateDelimiterInput_shouldThrowException {
    STAssertThrowsSpecificNamed([sut add:@"3,4\n,5"], NSException, @"DuplicateDelimitersException", @"The input should have thrown the expected exception.");
}

- (void)testAddMethod_customDelimiterInput_shouldReturnSum {
    NSInteger expected = 14;
    NSInteger result = [sut add:@"//$\n2$3\n4,5"];

    STAssertEquals(expected, result, @"Custom delimiter input should return sum.");
}

- (void)testAddMethod_negativeNumberInput_throwsException {
    @try {
        [sut add:@"3,-4,-7"];
        STAssertFalse(true, @"Negative number input should have thrown exception.");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"NegativeNumbersException", [ex name], @"The expected exception name was not thrown.");
        STAssertEqualObjects(@"You cannot input negative numbers: -4,-7,", [ex description], @"The expected exception description was not thrown.");
    }
}

- (void)testAddMethod_customMultiLengthDelimiterInput_shouldReturnSum {
    NSInteger expected = 14;
    NSInteger result = [sut add:@"//[$$$$$]\n2$$$$$3\n4,5"];

    STAssertEquals(expected, result, @"Custom multi-length delimiter input should return sum.");
}

- (void)testAddMethod_customMultiLengthMultiDelimiterInput_shouldReturnSum {
    NSInteger expected = 18;
    NSInteger result = [sut add:@"//[$$$$$][@@@]\n4@@@2$$$$$3\n4,5"];

    STAssertEquals(expected, result, @"Custom multi-length multi-delimiter input should return sum.");
}


@end
