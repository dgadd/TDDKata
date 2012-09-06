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

    STAssertEquals(expected, result, @"Zero length input should return 0.");
}

- (void)testAddMethod_oneLengthInput_returnsEquivalent {
    NSInteger expected = 8;
    NSInteger result = [sut add:@"8"];

    STAssertEquals(expected, result, @"One length input should return equivalent.");
}

- (void)testAddMethod_twoLengthInput_returnsSum {
    NSInteger expected = 8;
    NSInteger result = [sut add:@"5,3"];

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_anyLengthInput_returnsSum {
    NSInteger howMany = arc4random() % 999;
    NSInteger expected = 0;
    NSMutableString *numbersToAdd = [NSMutableString string];
    for (NSInteger i = 0; i < howMany; i++) {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        expected += i;
    }
    NSInteger result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Any length input should return sum.");
}

- (void)testAddMethod_newLineDelimiterInput_returnsSum {
    NSInteger expected = 10;
    NSInteger result = [sut add:@"5,3\n2"];

    STAssertEquals(expected, result, @"New line delimiter input should return sum.");
}

- (void)testAddMethod_duplicateDeimiterInput_throwsException {
    @try {
        [sut add:@"3,4\n,5"];
        STAssertFalse(true, @"Duplicate delimiter should throw exception.");
    } @catch (NSException *ex) {
        STAssertEqualObjects(@"DuplicateDelimitersException", [ex name], @"The expected exception name should match.");
        STAssertEqualObjects(@"You cannot input duplicate delimiters.", [ex description], @"The expected exception description should match.");
    }
}

- (void)testAddMethod_customDelimiterInput_returnsSum {
    NSInteger expected = 14;
    NSInteger result = [sut add:@"//$\n4$5,3\n2"];

    STAssertEquals(expected, result, @"Custom delimiter input should return sum.");
}

- (void)testAddMethod_negativeNumberInput_throwsException {
    @try {
        [sut add:@"3,4,5,-2,-9"];
        STAssertFalse(true, @"Negative number input should throw exception: -2,-9,");
    } @catch (NSException *ex) {
        STAssertEqualObjects(@"NegativeNumbersException", [ex name], @"The expected exception name should match.");
        STAssertEqualObjects(@"You cannot input negative numbers: -2,-9,", [ex description], @"The expected exception description should match.");
    }
}
- (void)testAddMethod_numbersGreaterThanOneThousand_areIgnored {
    NSInteger expected = 1007;
    NSInteger result = [sut add:@"3,5,999,1001"];

    STAssertEquals(expected, result, @"Numbers > 1000 should be ignored");
}


@end
