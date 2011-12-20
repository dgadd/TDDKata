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
    CalcOperationType calcOperationType = Add;
    int result = [sut doOperation:calcOperationType onValue:@""];
    int expected = 0;

    STAssertEquals(expected, result, @"Zero length input returns zero.");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    CalcOperationType calcOperationType = Add;
    int result = [sut doOperation:calcOperationType onValue:@"5"];
    int expected = 5;

    STAssertEquals(expected, result, @"One length input returns equivalent.");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    CalcOperationType calcOperationType = Add;
    int result = [sut doOperation:calcOperationType onValue:@"5,3"];
    int expected = 8;

    STAssertEquals(expected, result, @"Two length input returns sum.");
}

- (void)testAddMethod_AnyLengthInput_ReturnsSum {
    int howMany = arc4random() % 999;
    NSMutableString *numbersToAdd = [NSMutableString string];
    int expected = 0;
    CalcOperationType calcOperationType = Add;

    for(int i = 0; i < howMany; i++)
    {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%d,",i]];
        expected += i;
    }
    
    int result = [sut doOperation:calcOperationType onValue:numbersToAdd];

    STAssertEquals(expected, result, @"Two length input returns sum.");
}

- (void)testAddMethod_NewLineInput_ReturnsSum {
    CalcOperationType calcOperationType = Add;
    int result = [sut doOperation:calcOperationType onValue:@"5,3\n3"];
    int expected = 11;

    STAssertEquals(expected, result, @"New line delimiter input returns sum.");
}

- (void)testAddMethod_DuplicateDelimiterInput_ThrowsException {
    STAssertThrowsSpecificNamed([sut doOperation:Add onValue:@"5,\n3,5"], NSException, @"DuplicateDelimitersException", @"You cannot use duplicate delimiters");
}


- (void)dealloc {
    [super dealloc];
}


@end
