#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)testAddMethod_zeroLengthInput_returnsZero {
    NSInteger expected = 0;
    NSInteger result = [sut add:@""];

    STAssertEquals(result, expected, @"Zero length input should return 0");
}

- (void)testAddMethod_oneLengthInput_returnsEquivalent {
    NSInteger expected = 8;
    NSInteger result = [sut add:@"8"];

    STAssertEquals(result, expected, @"One length input should return equivalent");
}

- (void)testAddMethod_twoLengthInput_returnsSum {
    NSInteger expected = 8;
    NSInteger result = [sut add:@"3,5"];

    STAssertEquals(result, expected, @"Two length input should return sum");
}

- (void)testAddMethod_anyLengthInput_returnsSum {
    NSInteger randomAmount = arc4random() % 999;
    NSInteger expected = 0;
    NSMutableString *numbersToAdd = [NSMutableString string];

    for (NSInteger i = 0; i < randomAmount; i++) {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        expected += i;
    }

    NSInteger result = [sut add:numbersToAdd];

    STAssertEquals(result, expected, @"Two length input should return sum");
}

- (void)testAddMethod_newLineInput_returnsSum {
    NSInteger expected = 12;
    NSInteger result = [sut add:@"3,5\n4"];

    STAssertEquals(result, expected, @"New line input should return sum");
}

- (void)testAddMethod_duplicateDelimiterInput_throwsException {
    @try {
        [sut add:@"3,4\n,5"];
        STAssertFalse(true, @"Duplicate delimiters should throw exception");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"DuplicateDelimitersException", [ex name], @"The expected exception name should have been thrown");
        STAssertEqualObjects(@"You cannot input duplicate delimiters.", [ex description], @"The expected exception description should have been thrown");
    }
}

- (void)testAddMethod_customDelimiterInput_returnsSum {
    NSInteger expected = 14;
    NSInteger result = [sut add:@"//$\n2$3,5\n4"];

    STAssertEquals(result, expected, @"Custom delimiter input should return sum");
}

- (void)testAddMethod_negativeNumberInput_throwsException {
    @try {
        [sut add:@"3,4\n5,-3,-7"];
        STAssertFalse(true, @"Negative numbers should throw exception");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"NegativeNumbersException", [ex name], @"The expected exception name should have been thrown");
        STAssertEqualObjects(@"You cannot input negative numbers: -3,-7,", [ex description], @"The expected exception description should have been thrown");
    }
}

- (void)testAddMethod_numbersGreaterThanOneThousand_shouldBeIgnored {
    NSInteger expected = 1007;
    NSInteger result = [sut add:@"3,5,999,1001"];

    STAssertEquals(result, expected, @"Numbers > 1000 should be ignored.");
}

@end
