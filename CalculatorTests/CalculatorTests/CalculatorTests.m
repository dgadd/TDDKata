#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)tearDown {
    [sut release];
    [super tearDown];
}

- (void)testAddMethod_ZeroLengthInput_ReturnsZero {
    int result = [sut add:@""];
    int expected = 0;

    STAssertEquals(expected, result, @"Zero length input returns zero.");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    int result = [sut add:@"4"];
    int expected = 4;

    STAssertEquals(expected, result, @"One length input returns equivalent.");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    int result = [sut add:@"4,6"];
    int expected = 10;

    STAssertEquals(expected, result, @"Two length input returns sum.");
}

- (void)testAddMethod_AnyLengthInput_ReturnsSum {
    int howMany = arc4random() % 999;
    int expected = 0;
    NSMutableString *numbersToAdd = [NSMutableString string];

    for(int i = 0; i < howMany; i++) {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%d,",i]];
        expected += i;
    }

    int result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Any length input returns sum.");
}

- (void)testAddMethod_NewLineDelimiterInput_ReturnsSum {
    int result = [sut add:@"4,6\n8"];
    int expected = 18;

    STAssertEquals(expected, result, @"New line delimiter input returns sum.");
}

- (void)testAddMethod_DuplicateDelimiterInput_ThrowsException {
    STAssertThrowsSpecificNamed([sut add:@"3\n,4,5"], NSException, @"DuplicateDelimitersException", @"You cannot input duplicate delimiters.");
}

- (void)testAddMethod_CustomDelimiterInput_ReturnsSum {
    int result = [sut add:@"//#\n5#4,6\n8"];
    int expected = 23;

    STAssertEquals(expected, result, @"Custom delimiter input returns sum.");
}

- (void)testAddMethod_NegativeNumberInput_ThrowsException {
    STAssertThrowsSpecificNamed([sut add:@"3\n4,5,-6,-8"], NSException, @"NegativeNumbersException", @"You cannot input negative numbers.");
}

- (void)testAddMethod_NumbersGreaterThan1000_AreIgnored {
    int result = [sut add:@"3,1001,5,1000,2,999"];
    int expected = 2009;

    STAssertEquals(expected, result, @"Numbers greater than 1000 are ignored");
}



- (void)dealloc {
    [super dealloc];
}


@end
