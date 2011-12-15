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

    STAssertEquals(expected, result, @"Zero-length input should return 0.");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    int result = [sut add:@"4"];
    int expected = 4;

    STAssertEquals(expected, result, @"One-length input should return equivalent.");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    int result = [sut add:@"4,5"];
    int expected = 9;

    STAssertEquals(expected, result, @"Two-length input should return sum.");
}

- (void)testAddMethod_AnyLengthInput_ReturnsSum {
    int howMany = arc4random() % 999;
    NSMutableString *numbersToAdd = [NSMutableString string];
    int expected = 0;

    for(int i = 0; i < howMany; i++)
    {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        expected += i;
    }

    int result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Any-length input should return sum.");
}

- (void)testAddMethod_NewLineInput_ReturnsSum {
    int result = [sut add:@"4,5\n6"];
    int expected = 15;

    STAssertEquals(expected, result, @"New line delimiter input should return sum.");
}

- (void)testAddMethod_DuplicateDelimiterInput_ThrowsException {
    STAssertThrowsSpecificNamed([sut add:@"4\n,5,6"], NSException , @"DuplicateDelimitersException", @"You cannot submit duplicate delimiters");
}

- (void)testAddMethod_CustomDelimiterInput_ReturnsSum {
    int result = [sut add:@"//%\n4,5\n6%8"];
    int expected = 23;

    STAssertEquals(expected, result, @"New line delimiter input should return sum.");
}

- (void)testAddMethod_NegativeNumberInput_ThrowsException {
    STAssertThrowsSpecificNamed([sut add:@"4\n5,-6,-8"], NSException , @"NegativeNumbersException", @"You cannot sibmit negative numbers.");
}



- (void)dealloc {
    [super dealloc];
}


@end
