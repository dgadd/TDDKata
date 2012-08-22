#import "CalculatorTests.h"
#import "Calculator.h"

@implementation CalculatorTests

- (void)setUp {
    [super setUp];
    sut = [[Calculator alloc] init];
}

- (void)testAddMethod_ZeroLengthInput_ReturnsZero {
    NSInteger expected = 0;
    NSInteger result = [sut add:@""];

    STAssertEquals(expected, result, @"Zero length input should return 0.");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    NSInteger expected = 3;
    NSInteger result = [sut add:@"3"];

    STAssertEquals(expected, result, @"One length input should return equivalent.");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    NSInteger expected = 8;
    NSInteger result = [sut add:@"3,5"];

    STAssertEquals(expected, result, @"Two length input should return sum.");
}

- (void)testAddMethod_AnyLengthInput_ReturnsSum {
    int howMany = arc4random() % 999;
    NSInteger expected = 0;
    NSMutableString *numbersToAd = [NSMutableString string];
    for(int i = 0; i < howMany; i++) {
        [numbersToAd appendString:[NSString stringWithFormat:@"%d,",i]];
        expected += i;
    }

    NSInteger result = [sut add:numbersToAd];

    STAssertEquals(expected, result, @"Any length input should return sum.");
}

@end
