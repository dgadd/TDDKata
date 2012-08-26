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

    STAssertEquals(expected, result, @"Zero length input returns 0.");
}

- (void)testAddMethod_oneLengthInput_returnsEquivalent {
    NSInteger expected = 8;
    NSInteger result = [sut add:@"8"];

    STAssertEquals(expected, result, @"One length input returns equivalent.");
}

- (void)testAddMethod_twoLengthInput_returnsSum {
    NSInteger expected = 12;
    NSInteger result = [sut add:@"8,4"];

    STAssertEquals(expected, result, @"Two length input returns sum.");
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

    STAssertEquals(expected, result, @"Two length input returns sum.");
}

- (void)testAddMethod_newLineInput_returnsSum {
    NSInteger expected = 14;
    NSInteger result = [sut add:@"8,4\n2"];

    STAssertEquals(expected, result, @"New line input returns sum.");
}

- (void)testAddMethod_duplicateDelimiters_throwsException {
    @try {
        [sut add:@"3,5\n,4"];
        STAssertTrue(false, @"Duplicate delimiters should throw exception.");
    } @catch (NSException *ex) {
        STAssertEqualObjects(@"DuplicateDelimitersException", [ex name], @"Name for expected thrown exception should match.");
        STAssertEqualObjects(@"You cannot input duplicate delimiters.", [ex description], @"Description for expected thrown exception should match.");
    }
}

- (void)testAddMethod_customDelimiterInput_returnsSum {
    NSInteger expected = 14;
    NSInteger result = [sut add:@"//&\n3,5&6"];

    STAssertEquals(expected, result, @"Custom delimiter input should return sum");
}


@end
