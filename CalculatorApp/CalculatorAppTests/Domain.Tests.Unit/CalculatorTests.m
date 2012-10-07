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

- (void)testAddMethod_oneLengthInput_shouldReturnNumericEquivalent {
    NSInteger expected = 9;
    NSInteger result = [sut add:@"9"];

    STAssertEquals(expected, result, @"One length input should return numeric equivalent.");
}

- (void)testAddMethod_twoLengthInput_shouldReturnSum {
    NSInteger expected = 9;
    NSInteger result = [sut add:@"5,4"];

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_anyLengthInput_shouldReturnSum {
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

- (void)testAddMethod_newLineDelimiterInput_shouldReturnSum {
    NSInteger expected = 12;
    NSInteger result = [sut add:@"5,4\n3"];

    STAssertEquals(expected, result, @"New line delimiter input should return sum.");
}

- (void)testAddMethod_duplicateDelimiterInput_throwsException {
    STAssertThrowsSpecificNamed([sut add:@"3\n,4,5"], NSException, @"DuplicateDelimitersException", @"Duplciate delimiters should throw exception");
}

- (void)testAddMethod_customDelimiterInput_shouldReturnSum {
    NSInteger expected = 15;
    NSInteger result = [sut add:@"//#\n3#5,4\n3"];

    STAssertEquals(expected, result, @"Custom delimiter input should return sum.");
}

- (void)testAddMethod_negativeNumberInput_shouldThrowException {
    @try {
        [sut add:@"3,-9,-2"];
        STAssertFalse(true, @"Negative number input should have thrown exception.");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"NegativeNumbersException", [ex name], @"The expected exception name was now thrown.");
        STAssertEqualObjects(@"You cannot input negative numbers: -9,-2,", [ex description], @"The expected exception description was now thrown.");
    }
}

@end
