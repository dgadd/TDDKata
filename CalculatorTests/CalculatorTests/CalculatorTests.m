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

    STAssertEquals(expected, result, @"A zero-length input should return zero");
}

- (void)testAddMethod_OneLengthInput_ReturnsEquivalent {
    int result = [sut add:@"3"];
    int expected = 3;

    STAssertEquals(expected, result, @"A one-length input should return equivalent");
}

- (void)testAddMethod_TwoLengthInput_ReturnsSum {
    int result = [sut add:@"3,5"];
    int expected = 8;

    STAssertEquals(expected, result, @"A two-length input should return sum");
}

- (void)testAddMethod_AnyLengthInput_ReturnsSum {
    int howMany = arc4random() % 999;
    NSMutableString *numbersToAdd = [NSMutableString string];
    int expected = 0;

    for(int i = 0; i < howMany; i++)
    {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        expected += i;
    }
    
    int result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Any-length input should return sum");
}

- (void)testAddMethod_NewLineInput_ReturnsSum {
    int result = [sut add:@"3\n6,5"];
    int expected = 14;

    STAssertEquals(expected, result, @"A two-length input should return sum");
}


- (void)dealloc {
    [super dealloc];
}


@end
