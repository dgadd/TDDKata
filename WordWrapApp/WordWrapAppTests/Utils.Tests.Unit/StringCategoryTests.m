#import "StringCategoryTests.h"
#import "NSString+StringExtensions.h"

@implementation StringCategoryTests

- (void)testWrapLineByColumnWidthWithWordBreakMethod_columnWidth20_returnsLineWithWordBreaks {
    NSString *input = @"This is a complex, half-hyphenated line of text with numbers 2,138,454 and 'single quotes'.";
    NSString *expected = @"This is a complex, \nhalf-hyphenated \nline of text with \nnumbers 2,138,454 \nand 'single quotes'.";

    NSString *result = [input wrapLineByColumnWidth:20 withWordBreak:YES];

    STAssertEqualObjects(expected, result, @"When wordBreak is YES, the line should break at word boundaries.");
}


@end
