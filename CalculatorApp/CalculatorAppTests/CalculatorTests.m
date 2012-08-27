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

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_newLineDelimiterInput_returnsSum {
    NSInteger expected = 12;
    NSInteger result = [sut add:@"5,3\n4"];

    STAssertEquals(expected, result, @"New line delimiter input should return sum.");
}

- (void)testAddMethod_duplicateDelimiterInput_throwsException {
    @try {
        [sut add:@"3,4\n,5"];
        STAssertTrue(false, @"Duplicate delimiters should throw exception");
    } @catch (NSException *ex) {
        STAssertEqualObjects(@"DuplicateDelimitersException", [ex name], @"Exception name should match expected");
        STAssertEqualObjects(@"You cannot input duplicate delimiters", [ex description], @"Exception description should match expected");
    }
}

- (void)testAddMethod_customDelimiterInput_returnsSum {
    NSInteger expected = 15;
    NSInteger result = [sut add:@"//@\n3@5,3\n4"];

    STAssertEquals(expected, result, @"Custom delimiter input should return sum.");
}

- (void)testAddMethod_negativeNumberInput_throwsException {
    @try {
        [sut add:@"3,4\n5,-6,-2"];
        STAssertTrue(false, @"Negative numbers should throw exception");
    } @catch (NSException *ex) {
        STAssertEqualObjects(@"NegativeNumbersException", [ex name], @"Exception name should match expected");
        STAssertEqualObjects(@"You cannot input negative numbers: -6,-2,", [ex description], @"Exception description should match expected");
    }
}

- (void)testAddMethod_numbersGreaterThanOneThousand_shouldBeIgnored {
    NSInteger expected = 1014;
    NSInteger result = [sut add:@"6,2,7,999,1001"];

    STAssertEquals(expected, result, @"Numbers > 1000 should be ignored.");
}


@end
