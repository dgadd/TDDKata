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

    STAssertEquals(expected, result, @"Zero-length input should return 0");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    int result = [sut add:@"7"];
    int expected = 7;

    STAssertEquals(expected, result, @"One-length input should return equivalent");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    int result = [sut add:@"7,4"];
    int expected = 11;

    STAssertEquals(expected, result, @"Two-length input should return sum");
}

- (void)testAddMethod_AnyLengthInput_ReturnsSum {
    int howMany = arc4random() % 999;
    int expected = 0;
    NSMutableString *numbersToAdd = [NSMutableString string];
    for(int i = 0; i < howMany; i++)
    {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        expected += i;
    }
    
    
    int result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Any-length input should return sum");
}

- (void)testAddMethod_NewLineDelimiterInput_IsHandled {
    int result = [sut add:@"7,4\n5"];
    int expected = 16;

    STAssertEquals(expected, result, @"New line delimiter should be handled.");
}

- (void)testAddMethod_DuplicateDelimiters_RaisesException {
    STAssertThrowsSpecificNamed([sut add:@"8\n,8"], NSException, @"DuplicateDelimitersException", @"You cannot input duplicate delimiters.");
}

- (void)testAddMethod_CustomDelimiterInput_IsHandled {
    int result = [sut add:@"//@\n3@7,4\n5"];
    int expected = 19;

    STAssertEquals(expected, result, @"Custom delimiter should be handled.");
}


- (void)dealloc {
    [super dealloc];
}


@end
