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

    STAssertEquals(expected, result, @"Zero-length input returns zero.");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    int result = [sut add:@"7"];
    int expected = 7;

    STAssertEquals(expected, result, @"One-length input returns equivalent.");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    int result = [sut add:@"7,4"];
    int expected = 11;

    STAssertEquals(expected, result, @"Two-length input returns sum.");
}

- (void)testAddMethod_AnyLengthInput_ReturnsSum {
    int howMany = arc4random() % 999;
    int expected = 0;
    NSMutableString *numbersToAdd = [NSMutableString string];

    for(int i = 0; i < howMany; i++)
    {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%d,",i]];
        expected += i;
    }
    
    
    int result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Any-length input returns sum.");
}

- (void)testAddMethod_NewLineInput_ShouldBeHandled {
    int result = [sut add:@"7,4\n3"];
    int expected = 14;

    STAssertEquals(expected, result, @"New line delimiter should be handled");
}

- (void)testAddMethod_DuplicateDelimiterInput_ThrowsException {
    STAssertThrowsSpecificNamed([sut add:@"3\n,4,5"], NSException, @"DuplicateDelimitersException", @"Duplicate delimiters are not allowed.");
}

- (void)dealloc {
    [super dealloc];
}


@end
