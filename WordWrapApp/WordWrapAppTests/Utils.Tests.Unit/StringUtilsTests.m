#import "StringUtilsTests.h"
#import "StringUtils.h"

@implementation StringUtilsTests

- (void)setUp {
    [super setUp];
    sut = [[StringUtils alloc] init];
}

- (void)testWrapLineByColumnWidthMethod_columnWidthZero_shouldReturnNoLineBreaks {
    NSString *input = @"Here is a long line, hyphens-included, with 3.2713251 number examples.";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWdith:0];

    STAssertEqualObjects(expected, result, @"When column width is 0, result should have no line breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidthTwenty_shouldReturnExactLineBreaks {
    NSString *input = @"Here is a long line, hyphens-included, with 3.2713251 number examples.";
    NSString *expected = @"Here is a long line,\n hyphens-included, w\nith 3.2713251 number\n examples.";

    NSString *result = [sut wrapLine:input byColumnWdith:20];

    STAssertEqualObjects(expected, result, @"When column width is 20, result should have exact line breaks.");
}


@end
