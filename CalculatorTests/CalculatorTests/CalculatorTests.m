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

    STAssertEquals(expected, result, @"Zero lenght input shoudl return 0");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    int result = [sut add:@"5"];
    int expected = 5;

    STAssertEquals(expected, result, @"One lenght input shoudl return equivalent");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    int result = [sut add:@"5,9"];
    int expected = 14;

    STAssertEquals(expected, result, @"Two lenght input shoudl return sum");
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

    STAssertEquals(expected, result, @"Two lenght input shoudl return sum");
}

- (void)testAddMethod_NewLineDelimiterInput_IsHandled {
    int result = [sut add:@"5,9\n5"];
    int expected = 19;

    STAssertEquals(expected, result, @"Newline delimiter input should be handled");
}

- (void)testAddMethod_DuplicateDelimiterInput_ThrowsException {
    STAssertThrowsSpecificNamed([sut add:@"4,3\n,5"], NSException, @"DuplicateDelimiterException", @"You cannot input duplicate delimiters");
}


- (void)dealloc {
    [super dealloc];
}


@end
