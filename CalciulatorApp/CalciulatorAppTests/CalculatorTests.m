#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)testAddMethod_zeroLengthInput_returnsZero {
    NSInteger expected = 0;
    NSInteger result = [sut add:@""];

    STAssertEquals(expected, result, @"Zero length input should return 0.");
}

- (void)testAddMethod_oneLengthInput_returnsEquivalent {
    NSInteger expected = 3;
    NSInteger result = [sut add:@"3"];

    STAssertEquals(expected, result, @"One length input should return equivalent.");
}

- (void)testAddMethod_twoLengthInput_returnsSum {
    NSInteger expected = 8;
    NSInteger result = [sut add:@"3,5"];

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_anyLengthInput_returnsSum {
    NSInteger expected = 0;
    NSInteger howMany = arc4random() % 999;
    NSMutableString *numbersToAdd = [NSMutableString string];

    for (int i = 0; i < howMany; i++) {
        [numbersToAdd appendFormat:[NSString stringWithFormat:@"%d,",i]];
        expected += i;
    }

    NSInteger result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Any length input should return sum.");
}


@end
