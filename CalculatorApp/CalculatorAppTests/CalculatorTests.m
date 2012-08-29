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
        [numbersToAdd appendString:[NSString stringWithFormat:@"%d,",i]];
        expected += i;
    }

    NSInteger result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Any length input should return sum.");
}

- (void)testAddMethod_newLineDelimiterInput_returnsSum {
    NSInteger expected = 12;
    NSInteger result = [sut add:@"5,3\n4"];

    STAssertEquals(expected, result, @"New line delimiter input should return sum.");
}

- (void)testAddMethod_duplicateDelimiterInput_throwsException {
    @try {
        [sut add:@"3,4,\n5"];
        STAssertTrue(false, @"Duplicate delimiters should be rejected.");
    } @catch (NSException *ex) {
        STAssertEqualObjects(@"DuplicateDelimitersException", [ex name], @"Exception name should match expected.");
        STAssertEqualObjects(@"You cannot input duplicate delimiters.", [ex description], @"Exception name should match expected.");
    }
}

- (void)testAddMethod_customDelimiterInput_returnsSum {
    NSInteger expected = 14;
    NSInteger result = [sut add:@"//*\n2*5,3\n4"];

    STAssertEquals(expected, result, @"Custom delimiter input should return sum.");
}

- (void)testAddMethod_negativeNumbersInput_throwsException {
    @try {
        [sut add:@"3,4,5,-2,-8"];
        STAssertTrue(false, @"Negative numbers should be rejected.");
    } @catch (NSException *ex) {
        STAssertEqualObjects(@"NegativeNumbersException", [ex name], @"Exception name should match expected.");
        STAssertEqualObjects(@"You cannot input negative numbers: -2,-8,", [ex description], @"Exception name should match expected.");
    }
}


@end
