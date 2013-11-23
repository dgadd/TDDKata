#import <XCTest/XCTest.h>
#import "Calculator.h"

@interface CalculatorKataTests : XCTestCase

@end

@implementation CalculatorKataTests {
    Calculator *_sut;
}

- (void)setUp {
    [super setUp];
    _sut = [[Calculator alloc] init];
}


-(void)test_givenSut_whenZeroLengthStringInput_thenZeroReturned {
    NSInteger expected = 0;
    NSInteger result = [_sut add:@""];

    XCTAssertEqual(expected, result);
}

-(void)test_givenSut_whenOneLengthStringInput_thenNumericEquivalentReturned {
    NSInteger expected = 3;
    NSInteger result = [_sut add:@"3"];

    XCTAssertEqual(expected, result);
}

-(void)test_givenSut_whenTwoLengthStringInput_thenNumericEquivalentReturned {
    NSInteger expected = 9;
    NSInteger result = [_sut add:@"3,6"];

    XCTAssertEqual(expected, result);
}

-(void)test_givenSut_whenAnyLengthStringInput_thenNumericEquivalentReturned {
    NSInteger howMany = arc4random() % 9999;
    NSInteger expected = 0;

    NSMutableString *randomNumberString = [NSMutableString string];
    for(int i = 0; i < howMany; i++) {
        [randomNumberString appendFormat:@"%d,", i];
        expected += i;
    }

    NSInteger result = [_sut add:randomNumberString];

    XCTAssertEqual(expected, result);
}

@end
