#import "StringManipulatorTests.h"
#import "StringManipulator.h"

@implementation StringManipulatorTests

- (void)setUp {
    [super setUp];
    sut = [[StringManipulator alloc] init];
}

- (void)testWrapTextByColumnWidthMethod_zeroLengthInput_lineHasNoBreaks {
    NSString *input = @"John A. MacDonald was the first Prime Minister of Canada. Pierre Elliot Trudeau was the Prime Minister who re-patriated the Canadian constitution from the UK in 1982.";
    NSString *expected = input;

    NSString *result = [sut wrapText:input byColumnWidth:0];

    STAssertEqualObjects(expected, result, @"When column width is 0, the result should have no line breaks.");
}

@end
