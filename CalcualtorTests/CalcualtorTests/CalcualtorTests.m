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


- (void)dealloc {
    [super dealloc];
}


@end
