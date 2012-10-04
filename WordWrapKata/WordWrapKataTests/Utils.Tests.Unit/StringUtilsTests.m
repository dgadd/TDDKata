#import "StringUtilsTests.h"
#import "StringUtils.h"

@implementation StringUtilsTests

- (void)setUp {
    [super setUp];
    sut = [[StringUtils alloc] init];
}

- (void)testWrapLineByColumnWidthMethod_columnWidth0_lineShouldReturnWithNoBreaks {
    NSString *input = @"Here is a fancy-hyphentated line with 3.14 as PI and also; even a semi-colon.";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:0];

    STAssertEqualObjects(expected, result, @"When column width is 0, line should return with no breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidth20_lineShouldReturnWithExactBreaks {
    NSString *input = @"Here is a fancy-hyphentated line with 3.14 as PI and also; even a semi-colon.";
    NSString *expected = @"Here is a fancy-hyph\nentated line with 3.\n14 as PI and also; e\nven a semi-colon.";

    NSString *result = [sut wrapLine:input byColumnWidth:20];

    STAssertEqualObjects(expected, result, @"When column width is 20, line should return with exact breaks.");
}

- (void)testWrapLineByColumnWidthMethod_inputShorterThanColumnWidth_lineShouldReturnWithNoBreaks {
    NSString *input = @"very short";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:0];

    STAssertEqualObjects(expected, result, @"When input is shorter than column width, line should return with no breaks.");
}


@end
