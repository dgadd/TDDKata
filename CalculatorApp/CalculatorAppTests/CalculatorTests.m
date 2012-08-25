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

    STAssertEquals(expected, result, @"Zero length input returns zero.");
}

- (void)testAddMethod_oneLengthInput_returnsEquivalent {
    NSInteger expected = 3;
    NSInteger result = [sut add:@"3"];

    STAssertEquals(expected, result, @"One length input returns equivalent.");
}

- (void)testAddMethod_twoLengthInput_returnsSum {
    NSInteger expected = 12;
    NSInteger result = [sut add:@"5,7"];

    STAssertEquals(expected, result, @"Two length input returns sum.");
}

- (void)testAddMethod_anyLengthInput_returnsSum {
    NSInteger howMany = arc4random() % 999;
    NSInteger expected = 0;
    NSMutableString *numbersToAdd = [NSMutableString string];
    for(NSInteger i = 0; i < howMany; i++) {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        expected += i;
    }

    NSInteger result = [sut add:numbersToAdd];

    STAssertEquals(expected, result, @"Two length input returns sum.");
}

- (void)testAddMethod_newLineDelimiterInput_returnsSum {
    NSInteger expected = 15;
    NSInteger result = [sut add:@"5,7\n3"];

    STAssertEquals(expected, result, @"New line delimiter input returns sum.");
}

- (void)testAddMethod_dupicateDelimiterInput_throwsException {
    @try {
        [sut add:@"3\n,5,6"];
        STAssertTrue(false, @"Duplicate delimiter should throw exception.");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"DuplicateDelimitersException", [ex name], @"Exception name must match.");
        STAssertEqualObjects(@"You cannot input duplicate delimiters.", [ex description], @"Exception description must match.");
    }
}

@end
