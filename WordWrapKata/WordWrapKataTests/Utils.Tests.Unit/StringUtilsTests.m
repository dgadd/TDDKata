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

@end
