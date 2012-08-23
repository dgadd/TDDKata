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
    NSInteger expected = 3;
    NSInteger result = [sut add:@"3"];

    STAssertEquals(expected, result, @"One length input should return equivalent.");
}

- (void)testAddMethod_twoLengthInput_returnsSum {
    NSInteger expected = 8;
    NSInteger result = [sut add:@"3,5"];

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_anyLengthInput_returnsEquivlent {
    NSInteger howMany = arc4random() % 999;
    NSInteger expected = 0;
    NSMutableString *numbersToAdd = [NSMutableString string];

    for (int i = 0; i < howMany; i++) {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        expected += i;
    }

    NSInteger result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_newLineDelimiterInput_returnsSum {
    NSInteger expected = 10;
    NSInteger result = [sut add:@"3,5\n2"];

    STAssertEquals(expected, result, @"New line delimiter input should return sum.");
}

- (void)testAddMethod_duplicateDelimiterInput_throwsException {
    @try {
        [sut add:@"3,4\n,5"];
        STAssertTrue(false, @"This code should never be reached.");
    } @catch (NSException *ex) {
        STAssertEqualObjects(@"DuplicateDelimitersException", [ex name], @"Duplicate delimiters exception name should match");
        STAssertEqualObjects(@"You cannot input duplicate delimiters.", [ex description], @"Duplicate delimiters exception description should match");
    }
}


@end
