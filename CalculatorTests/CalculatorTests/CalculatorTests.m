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

- (void)testAddMethod_ZeroLengthInput_ReturnsZero{
    int result = [sut add:@""];
    int expected = 0;

    STAssertEquals(expected, result, @"Zero-length input should return zero.");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent{
    int result = [sut add:@"7"];
    int expected = 7;

    STAssertEquals(expected, result, @"One-length input should return equivalent.");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum{
    int result = [sut add:@"7,3"];
    int expected = 10;

    STAssertEquals(expected, result, @"Two-length input should return sum.");
}

- (void)testAddMethod_AnyLengthInput_ReturnsSum{
    int howMany = arc4random() % 999;
    int expected = 0;
    NSMutableString *numbersToAdd = [NSMutableString string];
    for(int i = 0; i < howMany; i++)
    {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        expected += i;
    }
    
    int result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Two-length input should return sum.");
}

- (void)testAddMethod_NewLineDelimiterInput_ReturnsSum{
    int result = [sut add:@"7\n4,3"];
    int expected = 14;

    STAssertEquals(expected, result, @"Two-length input should return sum.");
}

- (void)testAddMethod_DuplicateDelimiterInput_ThrowsSpecificException {
    STAssertThrowsSpecificNamed([sut add:@"4,\n5"], NSException, @"DuplicateDelimitersException", @"You cannot use duplicate delimiters");
}

- (void)testAddMethod_CustomDelimiterInput_ReturnsSum{
    int result = [sut add:@"//#\n3#7\n4,3"];
    int expected = 17;

    STAssertEquals(expected, result, @"Two-length input should return sum.");
}



- (void)dealloc {
    [super dealloc];
}


@end
