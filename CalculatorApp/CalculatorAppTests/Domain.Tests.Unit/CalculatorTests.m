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
    NSInteger expected = 9;
    NSInteger result = [sut add:@"9"];

    STAssertEquals(expected, result, @"One length input should return equivalent.");
}

- (void)testAddMethod_twoLengthInput_shouldReturnSum {
    NSInteger expected = 9;
    NSInteger result = [sut add:@"5,4"];

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

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_newLineDelimiterInput_shouldReturnSum {
    NSInteger expected = 16;
    NSInteger result = [sut add:@"5,4\n7"];

    STAssertEquals(expected, result, @"New line delimiter input should return sum.");
}

- (void)testAddMethod_duplicateDelimiterInput_shouldThrowException {
    @try {
        [sut add:@"3\n,4,5"];
        STAssertFalse(true, @"Dupicate delimiter input should throw exception.");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"DuplicateDelimitersException", [ex name], @"The expected exception name was not thrown.");
        STAssertEqualObjects(@"You cannot input duplicate delimiters.", [ex description], @"The expected exception description was not thrown.");
    }
}

- (void)testAddMethod_customDelimiterInput_shouldReturnSum {
    NSInteger expected = 19;
    NSInteger result = [sut add:@"//@\n3@5,4\n7"];

    STAssertEquals(expected, result, @"Custom delimiter input should return sum.");
}

- (void)testAddMethod_negativeNumberInput_shouldThrowException {
    @try {
        [sut add:@"3,-7,-1"];
        STAssertFalse(true, @"Negative number input should throw exception.");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"NegativeNumberException", [ex name], @"The expected exception name was not thrown.");
        STAssertEqualObjects(@"You cannot input negative numbers: -7,-1,", [ex description], @"The expected exception description was not thrown.");
    }
}

- (void)testAddMethod_numbersGreaterThanOneThousand_shouldBeIgnored {
    NSInteger expected = 1008;
    NSInteger result = [sut add:@"3,6,999,1001"];

    STAssertEquals(expected, result, @"Numbers > 1000 should be ignored.");
}

- (void)testAddMethod_customMultiLengthDelimiterInput_shouldReturnSum {
    NSInteger expected = 19;
    NSInteger result = [sut add:@"//[@@@@@]\n3@@@@@5,4\n7"];

    STAssertEquals(expected, result, @"Custom multi-length delimiter input should return sum.");
}






@end
