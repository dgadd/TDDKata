#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)testAddMethod_ZeroLengthInput_ReturnsZero {
    int result = [sut add:@""];
    int expected = 0;

    STAssertEquals(expected, result, @"Zero length input should return 0.");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    int result = [sut add:@"3"];
    int expected = 3;

    STAssertEquals(expected, result, @"One length input should return equivalent.");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    int result = [sut add:@"3,5"];
    int expected = 8;

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_AnyLengthInput_ReturnsSum {
    int howMany = arc4random() % 999;
    NSMutableString *numbersToAdd = [NSMutableString string];
    int expected = 0;

    for (int i = 0; i < howMany; i++) {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%d,",i]];
        expected += i;
    }

    int result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_NewLineInput_ReturnsSum {
    int result = [sut add:@"3,5\n8"];
    int expected = 16;

    STAssertEquals(expected, result, @"New line delimiter input should return sum.");
}

- (void)testAddMethod_DuplicateDelimiterInput_ThrowsException {
    STAssertThrowsSpecificNamed([sut add:@"3,,4"], NSException, @"DuplicateDelimitersException", @"");
}

- (void)testAddMethod_CustomDelimiterInput_ReturnsSum {
    int result = [sut add:@"//%\n3,5%6\n8"];
    int expected = 22;

    STAssertEquals(expected, result, @"Custom delimiter input should return sum.");
}


@end
