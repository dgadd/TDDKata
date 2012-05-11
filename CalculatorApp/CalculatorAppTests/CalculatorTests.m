#import "CalculatorTests.h"
#import "Calculator.h"

 @implementation CalculatorTests

 - (void)setUp {
     [super setUp];
     sut = [[Calculator alloc] init];
 }

 - (void)testAddMethod_zeroLengthInput_returnsZero {
     NSString *numbersToAdd = @"";
     int expected = 0;

     int result = [sut add:numbersToAdd];
     STAssertEquals(expected, result, @"0-length input should return 0.");
 }

 - (void)testAddMethod_oneLengthInput_returnsEquivalent {
     NSString *numbersToAdd = @"3";
     int expected = 3;

     int result = [sut add:numbersToAdd];
     STAssertEquals(expected, result, @"One length input should return equivalent.");
 }

 @end
