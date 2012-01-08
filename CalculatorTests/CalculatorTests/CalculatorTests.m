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
    int result = [sut add:@"3"];
    int expected = 3;

    STAssertEquals(expected, result, @"One length input returns equivalent.");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    int result = [sut add:@"3,4"];
    int expected = 7;

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

    STAssertEquals(expected, result, @"Two length input returns sum.");
}

- (void)testAddMethod_NewLineInput_IsHandled {
    int result = [sut add:@"3,4\n7"];
    int expected = 14;

    STAssertEquals(expected, result, @"New line delimiter input should be handled");
}

- (void)testAddMethod_DuplicateDelimiterInput_ThrowsException {
    STAssertThrowsSpecificNamed([sut add:@"3\n,4,5"], NSException, @"DuplicateDelimitersException", @"You cannot input duplicate delimiters.");
}

- (void)testAddMethod_CustomDelimiterInputInput_IsHandled {
    int result = [sut add:@"//$\n2$3,4\n7"];
    int expected = 16;

    STAssertEquals(expected, result, @"Custom delimiter input should be handled");
}


- (void)dealloc {
    [super dealloc];
}


@end
