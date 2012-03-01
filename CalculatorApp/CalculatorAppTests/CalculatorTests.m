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

    STAssertEquals(expected, result, @"Zero length input should return 0");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    int result = [sut add:@"7"];
    int expected = 7;

    STAssertEquals(expected, result, @"One length input should return equivalent");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    int result = [sut add:@"7,4"];
    int expected = 11;

    STAssertEquals(expected, result, @"Two length input should return sum");
}

- (void)testAddMethod_AnyLengthInput_ReturnsSum {
    int howMany = arc4random() % 999;
    NSMutableString *numbersToAdd = [NSMutableString string];
    int expected = 0;

    for(int i = 0; i < howMany; i++) {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%d,",i]];
        expected += i;
    }
    
    int result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Two length input should return sum");
}

- (void)testAddMethod_NewLineDelimiterInput_ReturnsSum {
    int result = [sut add:@"7,4\n3"];
    int expected = 14;

    STAssertEquals(expected, result, @"New line delimiter input should return sum");
}

- (void)testAddMethod_DuplicateDelimiterInput_ThrowsException {
    STAssertThrowsSpecificNamed([sut add:@"3,,4"], NSException, @"DuplicateDelimitersException", @"");
}

@end
