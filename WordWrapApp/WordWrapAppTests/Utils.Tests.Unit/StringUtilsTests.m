#import "StringUtilsTests.h"
#import "StringUtils.h"

@implementation StringUtilsTests

- (void)setUp {
    [super setUp];
    sut = [[StringUtils alloc] init];
}

- (void)testWrapLineByColumnWidthMethod_columnWidth0_returnsLineWithNoBreaks {
    NSString *input = @"Here is a line with multi-hypenated-context and 3.145 decimal numbers.";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:0];
    STAssertEqualObjects(expected, result, @"When column width is 0, line should return with no breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidth20_returnsLineWithExactBreaks {
    NSString *input = @"Here is a line with multi-hypenated-context and 3.145 decimal numbers.";
    NSString *expected = @"Here is a line with \nmulti-hypenated-cont\next and 3.145 decima\nl numbers.";

    NSString *result = [sut wrapLine:input byColumnWidth:20];
    STAssertEqualObjects(expected, result, @"When column width is 20, line should return with exact breaks.");
}


@end
