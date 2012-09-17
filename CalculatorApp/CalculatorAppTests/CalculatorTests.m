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
    NSInteger expected = 7;
    NSInteger result = [sut add:@"7"];

    STAssertEquals(expected, result, @"One length input should return equivalent.");
}

- (void)testAddMethod_twoLengthInput_returnsSum {
    NSInteger expected = 7;
    NSInteger result = [sut add:@"3,4"];

    STAssertEquals(expected, result, @"Two length input should return sum.");
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

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_newLineInput_returnsSum {
    NSInteger expected = 16;
    NSInteger result = [sut add:@"3,4\n9"];

    STAssertEquals(expected, result, @"New line input should return sum.");
}

- (void)testAddMethod_duplicateDelimiterInput_throwsException {
    @try {
        [sut add:@"3\n,4,5,6"];
        STAssertFalse(true, @"Duplicate delimiter input should throw exception");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"DuplicateDelimitersException", [ex name], @"The expected exception name was not thrown.");
        STAssertEqualObjects(@"You cannot input duplicate delimiters.", [ex description], @"The expected exception description was not thrown.");
    }
}

- (void)testAddMethod_customDelimiterInput_returnsSum {
    NSInteger expected = 20;
    NSInteger result = [sut add:@"//#\n4#3,4\n9"];

    STAssertEquals(expected, result, @"Custom delimiter input should return sum.");
}

- (void)testAddMethod_negativeNumbrerInput_throwsException {
    @try {
        [sut add:@"3,-5,-9"];
        STAssertFalse(true, @"Negative number input should throw exception");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"NegativeNumbersException", [ex name], @"The expected exception name was not thrown.");
        STAssertEqualObjects(@"You cannot input negative numbers: -5,-9,", [ex description], @"The expected exception description was not thrown.");
    }
}



@end
