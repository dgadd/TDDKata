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


@end
