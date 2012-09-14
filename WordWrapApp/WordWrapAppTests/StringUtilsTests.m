#import "StringUtilsTests.h"
#import "StringUtils.h"

@implementation StringUtilsTests

- (void)setUp {
    [super setUp];
    sut = [[StringUtils alloc] init];
}

- (void)testWrapLineByColumnWidthMethod_columnWidthZero_shouldReturnNoLineBreaks {
    NSString *input = @"Many multi-marmotted maps may multiply 3.14527 x more magnificently.";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:0];

    STAssertEqualObjects(expected, result, @"0 length column width should return unwrapped line.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidth20_shouldReturnExactLineBreaks {
    NSString *input = @"Many multi-marmotted maps may multiply 3.14527 x more magnificently.";
    NSString *expected = @"Many multi-marmotted\n maps may multiply 3\n.14527 x more magnif\nicently.";

    NSString *result = [sut wrapLine:input byColumnWidth:20];

    STAssertEqualObjects(expected, result, @"20 length column width should return exact line breaks.");
}

@end
