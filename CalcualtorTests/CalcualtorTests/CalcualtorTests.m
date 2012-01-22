#import "CalcualtorTests.h"
#import "Calcualtor.h"

@implementation CalcualtorTests

- (void)setUp {
    [super setUp];
    sut = [[Calcualtor alloc] init];
}

- (void)tearDown {
    [sut release];
    [super tearDown];  
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


- (void)dealloc {
    [super dealloc];
}


@end
