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

- (void)testAdd_ZeroLengthInput_ReturnsZero {
    int result = [sut add:@""];
    int expected = 0;

    STAssertEquals(expected, result, @"Zero length input should return 0");
}

- (void)testAdd_OneLengthInput_ReturnsEquivalent {
    int result = [sut add:@"3"];
    int expected = 3;

    STAssertEquals(expected, result, @"One length input should return equivalent");
}

- (void)testAdd_TwoLengthInput_ReturnsSum {
    int result = [sut add:@"3,7"];
    int expected = 10;

    STAssertEquals(expected, result, @"Two length input should return sum");
}

- (void)testAdd_AnyLengthInput_ReturnsSum {
    int howMany = arc4random() % 999;
    NSMutableString *numbersToAdd = [NSMutableString string];
    int expected = 0;

    for(int i = 0; i < howMany; i++)
    {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%d,",i]];
        expected += i;
    }
    
    int result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Any length input should return sum");
}

- (void)testAdd_NewLineInput_IsHandled {
    int result = [sut add:@"3,7\n4"];
    int expected = 14;

    STAssertEquals(expected, result, @"New line input should be handled");
}


- (void)dealloc {
    [super dealloc];
}


@end
