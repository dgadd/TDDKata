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

    STAssertEquals(expected, result, @"One length input should return numeric equivalent.");
}

- (void)testAddMethod_twoLengthInput_shouldReturnSum {
    NSInteger expected = 9;
    NSInteger result = [sut add:@"4,5"];

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_anyLengthInput_shouldReturnSum {
    NSInteger expected = 0;
    NSInteger randomAmount = arc4random() % 999;
    NSMutableString *numbersToAdd = [NSMutableString string];
    for(NSInteger i = 0; i < randomAmount; i++) {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        expected += i;
    }
    NSInteger result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Any length input should return sum.");
}

- (void)testAddMethod_newLineDelimiterInput_shouldReturnSum {
    NSInteger expected = 14;
    NSInteger result = [sut add:@"4,5\n5"];

    STAssertEquals(expected, result, @"New line delimiter input should return sum.");
}

-(void)testAddMethod_duplicateDelimiterInput_shouldThrowException {
    STAssertThrowsSpecificNamed([sut add:@"3,4\n,5"], NSException, @"DuplicateDelimitersException", @"The expected exception should have been thrown.");
}

- (void)testAddMethod_customDelimiterInput_shouldReturnSum {
    NSInteger expected = 17;
    NSInteger result = [sut add:@"//%\n3%4,5\n5"];

    STAssertEquals(expected, result, @"Custom delimiter input should return sum.");
}

-(void)testAddMethod_negativeNumberInput_shouldThrowException {
    @try {
        [sut add:@"3,-4,-7"];
        STAssertFalse(true, @"Negative number input should have thrown an exception");
    } @catch (NSException *ex) {
        STAssertEqualObjects(@"NegativeNumbersException", [ex name], @"The expected exception name should have been thrown");
        STAssertEqualObjects(@"You cannot input negative numbers: -4,-7,", [ex description], @"The expected exception description should have been thrown");
    }
}


@end
