#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)testAddMethod_zeroLengthInput_shouldReturnZero {
    NSInteger expected = 0;
    NSInteger result = [sut add:@""];

    STAssertEquals(expected, result, @"Zero length input should return 0.");
}

- (void)testAddMethod_oneLengthInput_shouldReturnEquivalent {
    NSInteger expected = 9;
    NSInteger result = [sut add:@"9"];

    STAssertEquals(expected, result, @"One length input should return equivalent.");
}

- (void)testAddMethod_twoLengthInput_shouldReturnSum {
    NSInteger expected = 9;
    NSInteger result = [sut add:@"5,4"];

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_anyLengthInput_shouldReturnSum {
    NSInteger randomAmount = arc4random() % 999;
    NSInteger expected = 0;
    NSMutableString *numbersToAdd = [NSMutableString string];
    for (NSInteger i = 0; i < randomAmount; i++) {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        expected += i;
    }
    NSInteger result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_newLineDelimiterInput_shouldReturnSum {
    NSInteger expected = 16;
    NSInteger result = [sut add:@"5,4\n7"];

    STAssertEquals(expected, result, @"New line delimiter input should return sum.");
}



@end
