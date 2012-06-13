#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)testAddMethod_zeroLengthInput_returns0 {
    int expected = 0;

    int result = [sut add:@""];
    STAssertEquals(expected, result, @"0-length input should return 0.");
}

- (void)testAddMethod_oneLengthInput_returnsEquivalent {
    int expected = 3;

    int result = [sut add:@"3"];
    STAssertEquals(expected, result, @"1-length input should return equivalent.");
}

- (void)testAddMethod_twoLengthInput_returnsSum {
    int expected = 8;

    int result = [sut add:@"3,5"];
    STAssertEquals(expected, result, @"2-length input should return sum.");
}

- (void)testAddMethod_anyLengthInput_returnsSum {
    int howMany = arc4random() % 999;
    int expected = 0;
    NSMutableString *numbersToAdd = [NSMutableString string];

    for (int i = 0; i < howMany; i++) {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%d,",i]];
        expected += i;
    }

    int result = [sut add:numbersToAdd];
    STAssertEquals(expected, result, @"Any-length input should return sum.");
}

@end
